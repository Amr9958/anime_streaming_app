import 'package:json_annotation/json_annotation.dart';
import 'package:anime_streaming_app/features/sample_feature/domain/entities/user.dart';

part 'user_model.g.dart';

/// User model for data layer
/// Extends User entity and adds JSON serialization capabilities
@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    super.avatar,
    required super.createdAt,
    required super.isActive,
  });

  /// Factory constructor for creating UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  /// Convert UserModel to JSON
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  /// Factory constructor for creating UserModel from User entity
  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      avatar: user.avatar,
      createdAt: user.createdAt,
      isActive: user.isActive,
    );
  }

  /// Convert UserModel to User entity
  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      avatar: avatar,
      createdAt: createdAt,
      isActive: isActive,
    );
  }

  /// Create a copy of UserModel with updated fields
  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? avatar,
    DateTime? createdAt,
    bool? isActive,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
    );
  }
}