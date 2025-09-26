import 'package:dio/dio.dart';
import 'package:anime_streaming_app/core/error/exceptions.dart';
import 'package:anime_streaming_app/core/network/network_info.dart';

/// Abstract base class for API client following Interface Segregation Principle
abstract class ApiClient {
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters});
  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters});
  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParameters});
  Future<Response> delete(String path, {Map<String, dynamic>? queryParameters});
}

/// Concrete implementation of ApiClient using Dio
class DioApiClient implements ApiClient {
  final Dio _dio;
  final NetworkInfo _networkInfo;

  DioApiClient({
    required Dio dio,
    required NetworkInfo networkInfo,
  }) : _dio = dio,
       _networkInfo = networkInfo;

  @override
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    return await _performRequest(() => _dio.get(path, queryParameters: queryParameters));
  }

  @override
  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    return await _performRequest(() => _dio.post(path, data: data, queryParameters: queryParameters));
  }

  @override
  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    return await _performRequest(() => _dio.put(path, data: data, queryParameters: queryParameters));
  }

  @override
  Future<Response> delete(String path, {Map<String, dynamic>? queryParameters}) async {
    return await _performRequest(() => _dio.delete(path, queryParameters: queryParameters));
  }

  /// Private method to handle common request logic and error handling
  Future<Response> _performRequest(Future<Response> Function() request) async {
    if (!await _networkInfo.isConnected) {
      throw NetworkException('No internet connection');
    }

    try {
      final response = await request();
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ServerException('Unexpected error occurred: ${e.toString()}');
    }
  }

  /// Handle Dio specific errors and convert them to custom exceptions
  Exception _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException('Connection timeout');
      case DioExceptionType.badResponse:
        return ServerException('Server error: ${error.response?.statusCode}');
      case DioExceptionType.cancel:
        return NetworkException('Request cancelled');
      case DioExceptionType.connectionError:
        return NetworkException('Connection error');
      case DioExceptionType.badCertificate:
        return NetworkException('Bad certificate');
      case DioExceptionType.unknown:
      default:
        return ServerException('Unknown error occurred');
    }
  }
}