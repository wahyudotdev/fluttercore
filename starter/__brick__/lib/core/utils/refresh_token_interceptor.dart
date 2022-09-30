import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../config/config.dart';
import 'dio_error_wrapper.dart';

/// Flow
///
/// onRequest -> onResponse / onError
///
@injectable
class RefreshTokenInterceptor extends QueuedInterceptorsWrapper {
  final FlutterSecureStorage _storage;

  static const authTokenKey = 'AUTH_TOKEN';
  static const authRefreshTokenKey = 'AUTH_REFRESH_TOKEN';
  static const fcmTokenKey = 'FCM_TOKEN';
  static const expiredMessage = 'token_not_valid';

  RefreshTokenInterceptor(this._storage);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final savedToken = await _savedToken;
    final headers = {
      'platform': Platform.isAndroid ? 'android' : 'ios',
    };
    if (savedToken != null) {
      headers['Authorization'] = 'Bearer $savedToken';
    }
    return handler.next(options.copyWith(headers: headers));
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 200 &&
        response.realUri.path.contains('/login')) {
      final data = response.data as Map<String, dynamic>;
      await _saveToken(data);
    }
    if (response.statusCode == 200 &&
        response.realUri.path.contains('/logout')) {
      await _storage.deleteAll();
    }
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint(err.response.toString());
    if (shouldRetry(err)) {
      try {
        final reqBody = {'refresh': await _savedRefreshToken};
        final response = await Dio(
          BaseOptions(
            baseUrl: Config.baseUrl,
          ),
        ).post('/api/refresh/', data: reqBody);
        if (response.statusCode == HttpStatus.ok) {
          final body = response.data as Map<String, dynamic>;
          await _storage.write(key: authTokenKey, value: body['access']);
          await retryRequest(err, handler);
        } else {
          return handler.reject(DioErrorWrapper(
              requestOptions: err.requestOptions, dioError: err));
        }
      } catch (e) {
        return handler.reject(
            DioErrorWrapper(requestOptions: err.requestOptions, dioError: err));
      }
    } else {
      return handler.reject(
          DioErrorWrapper(requestOptions: err.requestOptions, dioError: err));
    }
  }

  String get initialToken {
    final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final apiKey = base64Encode('$date|${Config.apiKey}'.codeUnits);
    return apiKey;
  }

  Future<String?> get _savedToken async =>
      await _storage.read(key: authTokenKey);

  Future<String?> get _savedRefreshToken async =>
      await _storage.read(key: authRefreshTokenKey);

  bool shouldRetry(DioError error) {
    var message = error.response?.data?['code'];
    if (message is String) {
      return message.contains(expiredMessage);
    }
    return false;
  }

  Future<void> _saveToken(Map<String, dynamic> body) async {
    await _storage.write(key: authTokenKey, value: body['access']);
    await _storage.write(key: authRefreshTokenKey, value: body['refresh']);
  }

  Future retryRequest(DioError err, ErrorInterceptorHandler handler) async {
    final token = await _savedToken;
    final headers = {
      'platform': Platform.isAndroid ? 'android' : 'ios',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    final response = await Dio().fetch(err.requestOptions.copyWith(
      headers: headers,
    ));
    if (response.statusCode == HttpStatus.ok) {
      return handler.resolve(response);
    } else {
      return handler.reject(
          DioErrorWrapper(requestOptions: err.requestOptions, dioError: err));
    }
  }
}
