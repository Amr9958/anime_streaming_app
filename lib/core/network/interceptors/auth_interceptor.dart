import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:anime_streaming_app/core/constants/api_constants.dart';

/// Interceptor for handling authentication tokens
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Get token from shared preferences
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    
    if (token != null && token.isNotEmpty) {
      options.headers[ApiConstants.authorization] = '${ApiConstants.bearer} $token';
    }
    
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle token refresh on 401 unauthorized
    if (err.response?.statusCode == 401) {
      final refreshed = await _refreshToken();
      
      if (refreshed) {
        // Retry the original request with new token
        final clonedRequest = await _retryRequest(err.requestOptions);
        return handler.resolve(clonedRequest);
      } else {
        // Clear token and redirect to login
        await _clearToken();
      }
    }
    
    super.onError(err, handler);
  }

  /// Refresh the authentication token
  Future<bool> _refreshToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final refreshToken = prefs.getString('refresh_token');
      
      if (refreshToken == null) return false;
      
      // Create a new Dio instance to avoid interceptor loops
      final dio = Dio();
      final response = await dio.post(
        ApiConstants.baseUrl + ApiConstants.apiVersion + ApiConstants.refreshToken,
        data: {'refresh_token': refreshToken},
      );
      
      if (response.statusCode == 200) {
        final newToken = response.data['access_token'];
        final newRefreshToken = response.data['refresh_token'];
        
        await prefs.setString('auth_token', newToken);
        await prefs.setString('refresh_token', newRefreshToken);
        
        return true;
      }
    } catch (e) {
      // Token refresh failed
    }
    
    return false;
  }

  /// Retry the original request with new token
  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    
    if (token != null) {
      requestOptions.headers[ApiConstants.authorization] = '${ApiConstants.bearer} $token';
    }
    
    final dio = Dio();
    return dio.fetch(requestOptions);
  }

  /// Clear authentication tokens
  Future<void> _clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('refresh_token');
  }
}