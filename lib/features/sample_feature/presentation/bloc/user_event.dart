part of 'user_bloc.dart';

/// Base class for all user events
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

/// Event to get all users
class GetUsersEvent extends UserEvent {
  const GetUsersEvent();
}

/// Event to get a specific user by ID
class GetUserByIdEvent extends UserEvent {
  final int id;

  const GetUserByIdEvent(this.id);

  @override
  List<Object> get props => [id];
}

/// Event to refresh the users list
class RefreshUsersEvent extends UserEvent {
  const RefreshUsersEvent();
}

/// Event to search users
class SearchUsersEvent extends UserEvent {
  final String query;

  const SearchUsersEvent(this.query);

  @override
  List<Object> get props => [query];
}