import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anime_streaming_app/features/sample_feature/presentation/bloc/user_bloc.dart';
import 'user_initial_widget.dart';
import 'user_loading_widget.dart';
import 'user_list_loaded_widget.dart';
import 'user_error_widget.dart';

/// Widget for displaying list of users
class UserListWidget extends StatelessWidget {
  const UserListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          return const UserInitialWidget();
        } else if (state is UserLoading) {
          return const UserLoadingWidget();
        } else if (state is UsersLoaded) {
          return UserListLoadedWidget(users: state.users);
        } else if (state is UserError) {
          return UserErrorWidget(message: state.message);
        }
        return const SizedBox.shrink();
      },
    );
  }
}