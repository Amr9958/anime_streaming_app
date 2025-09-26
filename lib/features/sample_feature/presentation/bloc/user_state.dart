part of 'user_bloc.dart';

/// Base class for all user states
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

/// Initial state
class UserInitial extends UserState {}

/// Loading state
class UserLoading extends UserState {}

/// State when users are successfully loaded
class UsersLoaded extends UserState {
  final List<User> users;

  const UsersLoaded(this.users);

  @override
  List<Object> get props => [users];
}

/// State when a single user is successfully loaded
class UserLoaded extends UserState {
  final User user;

  const UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

/// Error state
class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object> get props => [message];
}