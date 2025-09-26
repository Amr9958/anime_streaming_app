import 'package:dio/dio.dart';
import 'package:anime_streaming_app/core/constants/api_constants.dart';
import 'package:anime_streaming_app/core/network/interceptors/auth_interceptor.dart';
import 'package:anime_streaming_app/core/network/interceptors/logging_interceptor.dart';
import 'package:anime_streaming_app/core/network/interceptors/error_interceptor.dart';

/// Configuration class for Dio HTTP client
class DioConfig {
  static Dio createDio() {
    final dio = Dio();
    
    // Base configuration
    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl + ApiConstants.apiVersion,
      connectTimeout: Duration(milliseconds: ApiConstants.connectionTimeout),
      receiveTimeout: Duration(milliseconds: ApiConstants.receiveTimeout),
      sendTimeout: Duration(milliseconds: ApiConstants.sendTimeout),
      headers: {
        'Content-Type': ApiConstants.contentType,
        'Accept': ApiConstants.accept,
      },
    );
    
    // Add interceptors
    dio.interceptors.addAll([
      LoggingInterceptor(),
      AuthInterceptor(),
      ErrorInterceptor(),
    ]);
    
    return dio;
  }
  
  // Private constructor to prevent instantiation
  DioConfig._();
}