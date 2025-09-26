import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:anime_streaming_app/features/sample_feature/domain/entities/user.dart';
import 'package:anime_streaming_app/features/sample_feature/domain/usecases/get_users.dart';
import 'package:anime_streaming_app/features/sample_feature/domain/usecases/get_user_by_id.dart';
import 'package:anime_streaming_app/core/usecases/usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

/// BLoC for managing user-related state
/// Follows Single Responsibility Principle - only handles user state management
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUsersUseCase;
  final GetUserById getUserByIdUseCase;

  UserBloc({
    required this.getUsersUseCase,
    required this.getUserByIdUseCase,
  }) : super(UserInitial()) {
    on<GetUsersEvent>(_onGetUsers);
    on<GetUserByIdEvent>(_onGetUserById);
    on<RefreshUsersEvent>(_onRefreshUsers);
  }

  /// Handle GetUsersEvent
  Future<void> _onGetUsers(GetUsersEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    
    final result = await getUsersUseCase();
    
    result.fold(
      (failure) => emit(UserError(failure.message)),
      (users) => emit(UsersLoaded(users)),
    );
  }

  /// Handle GetUserByIdEvent
  Future<void> _onGetUserById(GetUserByIdEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    
    final result = await getUserByIdUseCase(GetUserByIdParams(id: event.id));
    
    result.fold(
      (failure) => emit(UserError(failure.message)),
      (user) => emit(UserLoaded(user)),
    );
  }

  /// Handle RefreshUsersEvent
  Future<void> _onRefreshUsers(RefreshUsersEvent event, Emitter<UserState> emit) async {
    // Don't emit loading state for refresh to avoid UI flicker
    final result = await getUsersUseCase();
    
    result.fold(
      (failure) => emit(UserError(failure.message)),
      (users) => emit(UsersLoaded(users)),
    );
  }
}