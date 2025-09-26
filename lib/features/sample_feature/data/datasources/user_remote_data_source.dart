import 'package:anime_streaming_app/core/network/api_client.dart';
import 'package:anime_streaming_app/core/constants/api_constants.dart';
import 'package:anime_streaming_app/core/error/exceptions.dart';
import 'package:anime_streaming_app/features/sample_feature/data/models/user_model.dart';

/// Abstract interface for user remote data source
abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
  Future<UserModel> getUserById(int id);
  Future<UserModel> createUser({
    required String name,
    required String email,
    String? avatar,
  });
  Future<UserModel> updateUser({
    required int id,
    String? name,
    String? email,
    String? avatar,
    bool? isActive,
  });
  Future<bool> deleteUser(int id);
  Future<List<UserModel>> searchUsers(String query);
}

/// Implementation of UserRemoteDataSource using API client
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiClient apiClient;

  UserRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await apiClient.get(ApiConstants.users);
      
      if (response.statusCode == 200) {
        final List<dynamic> usersJson = response.data['data'] ?? response.data;
        return usersJson.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw ServerException('Failed to fetch users: ${response.statusCode}');
      }
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException('Unexpected error while fetching users: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> getUserById(int id) async {
    try {
      final response = await apiClient.get('${ApiConstants.users}/$id');
      
      if (response.statusCode == 200) {
        final userJson = response.data['data'] ?? response.data;
        return UserModel.fromJson(userJson);
      } else {
        throw ServerException('Failed to fetch user: ${response.statusCode}');
      }
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException('Unexpected error while fetching user: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> createUser({
    required String name,
    required String email,
    String? avatar,
  }) async {
    try {
      final data = {
        'name': name,
        'email': email,
        if (avatar != null) 'avatar': avatar,
      };
      
      final response = await apiClient.post(ApiConstants.users, data: data);
      
      if (response.statusCode == 201 || response.statusCode == 200) {
        final userJson = response.data['data'] ?? response.data;
        return UserModel.fromJson(userJson);
      } else {
        throw ServerException('Failed to create user: ${response.statusCode}');
      }
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException('Unexpected error while creating user: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> updateUser({
    required int id,
    String? name,
    String? email,
    String? avatar,
    bool? isActive,
  }) async {
    try {
      final data = <String, dynamic>{};
      if (name != null) data['name'] = name;
      if (email != null) data['email'] = email;
      if (avatar != null) data['avatar'] = avatar;
      if (isActive != null) data['is_active'] = isActive;
      
      final response = await apiClient.put('${ApiConstants.users}/$id', data: data);
      
      if (response.statusCode == 200) {
        final userJson = response.data['data'] ?? response.data;
        return UserModel.fromJson(userJson);
      } else {
        throw ServerException('Failed to update user: ${response.statusCode}');
      }
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException('Unexpected error while updating user: ${e.toString()}');
    }
  }

  @override
  Future<bool> deleteUser(int id) async {
    try {
      final response = await apiClient.delete('${ApiConstants.users}/$id');
      
      if (response.statusCode == 200 || response.statusCode == 204) {
        return true;
      } else {
        throw ServerException('Failed to delete user: ${response.statusCode}');
      }
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException('Unexpected error while deleting user: ${e.toString()}');
    }
  }

  @override
  Future<List<UserModel>> searchUsers(String query) async {
    try {
      final response = await apiClient.get(
        ApiConstants.users,
        queryParameters: {'search': query},
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> usersJson = response.data['data'] ?? response.data;
        return usersJson.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw ServerException('Failed to search users: ${response.statusCode}');
      }
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException('Unexpected error while searching users: ${e.toString()}');
    }
  }
}