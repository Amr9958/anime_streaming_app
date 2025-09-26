import 'package:equatable/equatable.dart';

/// Abstract base class for failures
abstract class Failure extends Equatable {
  final String message;
  
  const Failure(this.message);
  
  @override
  List<Object> get props => [message];
}

/// Failure for server-related errors
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Failure for network connectivity issues
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// Failure for cache-related errors
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

/// Failure for data format issues
class FormatFailure extends Failure {
  const FormatFailure(super.message);
}

/// Failure for authentication issues
class AuthenticationFailure extends Failure {
  const AuthenticationFailure(super.message);
}

/// Failure for authorization issues
class AuthorizationFailure extends Failure {
  const AuthorizationFailure(super.message);
}