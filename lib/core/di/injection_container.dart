import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:anime_streaming_app/core/network/api_client.dart';
import 'package:anime_streaming_app/core/network/network_info.dart';
import 'package:anime_streaming_app/core/network/dio_config.dart';
import 'package:anime_streaming_app/features/sample_feature/data/datasources/user_remote_data_source.dart';
import 'package:anime_streaming_app/features/sample_feature/data/repositories/user_repository_impl.dart';
import 'package:anime_streaming_app/features/sample_feature/domain/repositories/user_repository.dart';
import 'package:anime_streaming_app/features/sample_feature/domain/usecases/get_users.dart';
import 'package:anime_streaming_app/features/sample_feature/domain/usecases/get_user_by_id.dart';
import 'package:anime_streaming_app/features/sample_feature/presentation/bloc/user_bloc.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  setupCoreDependencies();
  setupFeatureDependencies();
}

/// Manual dependency registration for core services
void setupCoreDependencies() {
  // External dependencies
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<Dio>(() => DioConfig.createDio());
  
  // Core services
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<Connectivity>()),
  );
  
  getIt.registerLazySingleton<ApiClient>(
    () => DioApiClient(
      dio: getIt<Dio>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );
}

/// Register feature dependencies
void setupFeatureDependencies() {
  _setupUserFeatureDependencies();
}

/// Setup user feature dependencies
void _setupUserFeatureDependencies() {
  // Data sources
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(apiClient: getIt<ApiClient>()),
  );
  
  // Repositories
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: getIt<UserRemoteDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );
  
  // Use cases
  getIt.registerLazySingleton(() => GetUsers(getIt<UserRepository>()));
  getIt.registerLazySingleton(() => GetUserById(getIt<UserRepository>()));
  
  // BLoC
  getIt.registerFactory(
    () => UserBloc(
      getUsersUseCase: getIt(),
      getUserByIdUseCase: getIt(),
    ),
  );
}

/// Initialize all dependencies
Future<void> initializeDependencies() async {
  configureDependencies();
}