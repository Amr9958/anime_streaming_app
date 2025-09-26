/// Base exception class for the application
abstract class AppException implements Exception {
  final String message;
  const AppException(this.message);

  @override
  String toString() => message;
}

/// Exception thrown when there's a server error
class ServerException extends AppException {
  const ServerException(super.message);
}

/// Exception thrown when there's a network connectivity issue
class NetworkException extends AppException {
  const NetworkException(super.message);
}

/// Exception thrown when there's a cache error
class CacheException extends AppException {
  const CacheException(super.message);
}

/// Exception thrown when data format is invalid
class FormatException extends AppException {
  const FormatException(super.message);
}

/// Exception thrown when authentication fails
class AuthenticationException extends AppException {
  const AuthenticationException(super.message);
}

/// Exception thrown when authorization fails
class AuthorizationException extends AppException {
  const AuthorizationException(super.message);
}