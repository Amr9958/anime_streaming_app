import 'package:dio/dio.dart';
import 'dart:developer' as developer;

/// Interceptor for logging HTTP requests and responses
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    developer.log(
      '🚀 REQUEST[${options.method}] => PATH: ${options.path}',
      name: 'HTTP_REQUEST',
    );
    developer.log(
      'Headers: ${options.headers}',
      name: 'HTTP_REQUEST',
    );
    if (options.data != null) {
      developer.log(
        'Data: ${options.data}',
        name: 'HTTP_REQUEST',
      );
    }
    if (options.queryParameters.isNotEmpty) {
      developer.log(
        'Query Parameters: ${options.queryParameters}',
        name: 'HTTP_REQUEST',
      );
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    developer.log(
      '✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      name: 'HTTP_RESPONSE',
    );
    developer.log(
      'Data: ${response.data}',
      name: 'HTTP_RESPONSE',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    developer.log(
      '❌ ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
      name: 'HTTP_ERROR',
    );
    developer.log(
      'Error: ${err.message}',
      name: 'HTTP_ERROR',
    );
    if (err.response?.data != null) {
      developer.log(
        'Error Data: ${err.response?.data}',
        name: 'HTTP_ERROR',
      );
    }
    super.onError(err, handler);
  }
}