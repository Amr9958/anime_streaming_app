import 'package:dio/dio.dart';
import 'package:anime_streaming_app/core/error/exceptions.dart';

/// Interceptor for handling and transforming HTTP errors
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = _mapDioErrorToException(err);
    
    // Create a new DioException with our custom exception
    final customError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: exception,
      message: exception.message,
    );
    
    super.onError(customError, handler);
  }

  /// Map DioException to custom application exceptions
  AppException _mapDioErrorToException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException('Request timeout. Please check your internet connection.');
      
      case DioExceptionType.badResponse:
        return _handleResponseError(error.response!);
      
      case DioExceptionType.cancel:
        return const NetworkException('Request was cancelled.');
      
      case DioExceptionType.connectionError:
        return const NetworkException('Connection failed. Please check your internet connection.');
      
      case DioExceptionType.badCertificate:
        return const NetworkException('Certificate verification failed.');
      
      case DioExceptionType.unknown:
      default:
        return ServerException('An unexpected error occurred: ${error.message}');
    }
  }

  /// Handle HTTP response errors based on status code
  AppException _handleResponseError(Response response) {
    final statusCode = response.statusCode;
    final data = response.data;
    
    // Try to extract error message from response
    String errorMessage = 'An error occurred';
    if (data is Map<String, dynamic>) {
      errorMessage = data['message'] ?? data['error'] ?? errorMessage;
    }
    
    switch (statusCode) {
      case 400:
        return ServerException('Bad request: $errorMessage');
      case 401:
        return const AuthenticationException('Authentication failed. Please login again.');
      case 403:
        return const AuthorizationException('Access denied. You do not have permission to perform this action.');
      case 404:
        return const ServerException('The requested resource was not found.');
      case 422:
        return ServerException('Validation failed: $errorMessage');
      case 429:
        return const ServerException('Too many requests. Please try again later.');
      case 500:
        return const ServerException('Internal server error. Please try again later.');
      case 502:
        return const ServerException('Bad gateway. Please try again later.');
      case 503:
        return const ServerException('Service unavailable. Please try again later.');
      case 504:
        return const ServerException('Gateway timeout. Please try again later.');
      default:
        return ServerException('Server error ($statusCode): $errorMessage');
    }
  }
}