import 'package:dartz/dartz.dart';
import 'package:anime_streaming_app/core/error/failures.dart';
import 'package:anime_streaming_app/features/sample_feature/domain/entities/user.dart';

/// Abstract repository interface for user operations
/// Follows Dependency Inversion Principle - high-level modules don't depend on low-level modules
abstract class UserRepository {
  /// Get all users
  Future<Either<Failure, List<User>>> getUsers();
  
  /// Get user by ID
  Future<Either<Failure, User>> getUserById(int id);
  
  /// Create a new user
  Future<Either<Failure, User>> createUser({
    required String name,
    required String email,
    String? avatar,
  });
  
  /// Update an existing user
  Future<Either<Failure, User>> updateUser({
    required int id,
    String? name,
    String? email,
    String? avatar,
    bool? isActive,
  });
  
  /// Delete a user
  Future<Either<Failure, bool>> deleteUser(int id);
  
  /// Search users by name or email
  Future<Either<Failure, List<User>>> searchUsers(String query);
}