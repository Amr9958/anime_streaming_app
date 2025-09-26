import 'package:flutter/material.dart';

class UserInitialWidget extends StatelessWidget {
  const UserInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Welcome! Tap refresh to load users.'),
    );
  }
}