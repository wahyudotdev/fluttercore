import 'package:dio/dio.dart';

class DioErrorWrapper extends DioError {
  final DioError dioError;

  DioErrorWrapper({required super.requestOptions, required this.dioError});

  @override
  String get message {
    if (dioError.type == DioErrorType.response) {
      final body = dioError.response?.data as Map<String, dynamic>;
      return body['message'].toString();
    }
    return 'unknown error';
  }
}
