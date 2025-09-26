import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../../domain/entities/user.dart';
import 'user_list_item_widget.dart';

class UserListLoadedWidget extends StatelessWidget {
  final List<User> users;

  const UserListLoadedWidget({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return const Center(
        child: Text('No users found.'),
      );
    }
    
    return RefreshIndicator(
      onRefresh: () async {
        context.read<UserBloc>().add(const RefreshUsersEvent());
      },
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return UserListItemWidget(user: user);
        },
      ),
    );
  }
}