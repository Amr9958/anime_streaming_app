import 'package:dartz/dartz.dart';
import 'package:anime_streaming_app/core/error/failures.dart';
import 'package:anime_streaming_app/core/usecases/usecase.dart';
import 'package:anime_streaming_app/features/sample_feature/domain/entities/user.dart';
import 'package:anime_streaming_app/features/sample_feature/domain/repositories/user_repository.dart';

/// Use case for getting all users
/// Follows Single Responsibility Principle - only responsible for getting users
class GetUsers implements NoParamsUseCase<List<User>> {
  final UserRepository repository;

  GetUsers(this.repository);

  @override
  Future<Either<Failure, List<User>>> call() async {
    return await repository.getUsers();
  }
}