import 'package:dartz/dartz.dart';
import 'package:anime_streaming_app/core/error/exceptions.dart';
import 'package:anime_streaming_app/core/error/failures.dart';
import 'package:anime_streaming_app/core/network/network_info.dart';
import 'package:anime_streaming_app/features/sample_feature/data/datasources/user_remote_data_source.dart';
import 'package:anime_streaming_app/features/sample_feature/domain/entities/user.dart';
import 'package:anime_streaming_app/features/sample_feature/domain/repositories/user_repository.dart';

/// Implementation of UserRepository
/// Follows Dependency Inversion Principle - depends on abstractions, not concretions
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUsers = await remoteDataSource.getUsers();
        return Right(remoteUsers.map((model) => model.toEntity()).toList());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } on NetworkException catch (e) {
        return Left(NetworkFailure(e.message));
      } catch (e) {
        return Left(ServerFailure('Unexpected error: ${e.toString()}'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, User>> getUserById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.getUserById(id);
        return Right(remoteUser.toEntity());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } on NetworkException catch (e) {
        return Left(NetworkFailure(e.message));
      } catch (e) {
        return Left(ServerFailure('Unexpected error: ${e.toString()}'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, User>> createUser({
    required String name,
    required String email,
    String? avatar,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.createUser(
          name: name,
          email: email,
          avatar: avatar,
        );
        return Right(remoteUser.toEntity());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } on NetworkException catch (e) {
        return Left(NetworkFailure(e.message));
      } catch (e) {
        return Left(ServerFailure('Unexpected error: ${e.toString()}'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, User>> updateUser({
    required int id,
    String? name,
    String? email,
    String? avatar,
    bool? isActive,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.updateUser(
          id: id,
          name: name,
          email: email,
          avatar: avatar,
          isActive: isActive,
        );
        return Right(remoteUser.toEntity());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } on NetworkException catch (e) {
        return Left(NetworkFailure(e.message));
      } catch (e) {
        return Left(ServerFailure('Unexpected error: ${e.toString()}'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUser(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.deleteUser(id);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } on NetworkException catch (e) {
        return Left(NetworkFailure(e.message));
      } catch (e) {
        return Left(ServerFailure('Unexpected error: ${e.toString()}'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<User>>> searchUsers(String query) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUsers = await remoteDataSource.searchUsers(query);
        return Right(remoteUsers.map((model) => model.toEntity()).toList());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } on NetworkException catch (e) {
        return Left(NetworkFailure(e.message));
      } catch (e) {
        return Left(ServerFailure('Unexpected error: ${e.toString()}'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }
}