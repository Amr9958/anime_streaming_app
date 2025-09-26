import 'package:equatable/equatable.dart';

/// User entity representing the core business object
class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? avatar;
  final DateTime createdAt;
  final bool isActive;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    required this.createdAt,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        avatar,
        createdAt,
        isActive,
      ];

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, avatar: $avatar, createdAt: $createdAt, isActive: $isActive)';
  }
}