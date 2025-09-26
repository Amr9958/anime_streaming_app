/// API related constants
class ApiConstants {
  // Base URLs
  static const String baseUrl = 'https://api.example.com';
  static const String apiVersion = '/v1';
  
  // Timeouts
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
  static const int sendTimeout = 30000; // 30 seconds
  
  // Headers
  static const String contentType = 'application/json';
  static const String accept = 'application/json';
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';
  
  // Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String refreshToken = '/auth/refresh';
  static const String logout = '/auth/logout';
  
  // Sample endpoints
  static const String users = '/users';
  static const String posts = '/posts';
  
  // Private constructor to prevent instantiation
  ApiConstants._();
}