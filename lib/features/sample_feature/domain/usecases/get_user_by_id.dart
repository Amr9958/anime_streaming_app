import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:anime_streaming_app/core/error/failures.dart';
import 'package:anime_streaming_app/core/usecases/usecase.dart';
import 'package:anime_streaming_app/features/sample_feature/domain/entities/user.dart';
import 'package:anime_streaming_app/features/sample_feature/domain/repositories/user_repository.dart';

/// Use case for getting a user by ID
class GetUserById implements UseCase<User, GetUserByIdParams> {
  final UserRepository repository;

  GetUserById(this.repository);

  @override
  Future<Either<Failure, User>> call(GetUserByIdParams params) async {
    return await repository.getUserById(params.id);
  }
}

/// Parameters for GetUserById use case
class GetUserByIdParams extends Params {
  final int id;

  const GetUserByIdParams({required this.id});

  @override
  List<Object> get props => [id];
}