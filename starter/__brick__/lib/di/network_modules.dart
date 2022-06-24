import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../core/config/config.dart';

@module
abstract class NetworkModule {
  @dev
  @preResolve
  Future<Dio> devDio(FlutterSecureStorage storage) async {
    final dio = Dio(BaseOptions(baseUrl: Config.baseUrl));

    // menampilkan log api request
    dio.interceptors.add(await _headerBuilder(storage));
    dio.interceptors
        .add(DioLoggingInterceptor(level: Level.body, compact: false));
    return dio;
  }

  Future<QueuedInterceptorsWrapper> _headerBuilder(
      FlutterSecureStorage storage) async {
    return QueuedInterceptorsWrapper(onRequest: (r, interceptor) async {
      var savedToken = await storage.read(key: 'API_TOKEN');
      if (savedToken == null) {
        var date = DateFormat('yyyy-MM-dd').format(DateTime.now());
        var apiKey = base64Encode('$date|${Config.apiKey}'.codeUnits);
        var response = await Dio(BaseOptions(baseUrl: Config.baseUrl))
            .get('/token/get-token',
                options: Options(headers: {
                  'Authorization': 'Bearer $apiKey',
                }));

        if (response.statusCode == 200) {
          var body = response.data as Map<String, dynamic>;
          var token = body['data']['token'];
          await storage.write(key: 'API_TOKEN', value: token);
          interceptor.next(r.copyWith(headers: {
            'Authorization': 'Bearer $token',
            'platform': Platform.isAndroid ? 'android' : 'ios',
            'regid': 'fcm'
          }));
        }
      } else {
        interceptor.next(r.copyWith(headers: {
          'Authorization': 'Bearer $savedToken',
          'platform': Platform.isAndroid ? 'android' : 'ios',
          'regid': 'fcm'
        }));
      }
    }, onError: (e, interceptor) async {
      if (e.response?.data['error'] == 'expired_token') {
        await storage.delete(key: 'API_TOKEN');
      }
      interceptor.reject(e);
    }, onResponse: (resp, interceptor) async {
      if (resp.statusCode == 200 && resp.realUri.path.contains('/login')) {
        var body = resp.data as Map<String, dynamic>;
        var token = body['data']['token'];
        await storage.write(key: 'API_TOKEN', value: token);
      }
      interceptor.next(resp);
    });
  }
}
