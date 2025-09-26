import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:anime_streaming_app/core/error/failures.dart';

/// Abstract base class for all use cases
/// Follows Single Responsibility Principle - each use case has one responsibility
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Use case that doesn't require parameters
abstract class NoParamsUseCase<Type> {
  Future<Either<Failure, Type>> call();
}

/// Base class for use case parameters
abstract class Params extends Equatable {
  const Params();
}

/// Empty parameters for use cases that don't need parameters
class NoParams extends Params {
  const NoParams();
  
  @override
  List<Object> get props => [];
}