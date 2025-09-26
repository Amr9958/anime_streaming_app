import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anime_streaming_app/features/sample_feature/presentation/bloc/user_bloc.dart';
import 'package:anime_streaming_app/features/sample_feature/presentation/widgets/user_list_widget.dart';
import 'package:anime_streaming_app/core/di/injection_container.dart';

/// Users page displaying list of users
class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<UserBloc>().add(const RefreshUsersEvent());
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => getIt<UserBloc>()..add(const GetUsersEvent()),
        child: const UserListWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to add user page
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Add user functionality coming soon!'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}