import 'package:flutter_revierpod_project_architecture/core/domain/provider/dio_service_provider.dart';
import 'package:flutter_revierpod_project_architecture/core/usecase/use_case.dart';
import 'package:flutter_revierpod_project_architecture/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:flutter_revierpod_project_architecture/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:flutter_revierpod_project_architecture/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_revierpod_project_architecture/features/auth/domain/usecase/auth_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/authentication_repository_impl.dart';

var authRemoteDataSource = Provider<AuthRemoteDataSource>((ref) {
  var networkProvider = ref.watch(networkServiceProvider);
  return AuthRemoteDataSourceImp(networkProvider);
});
var authLocalDataSource =
    Provider<AuthLocalDataSource>((ref) => AuthLocalDataSourceImpl());

var authRepoProvider = Provider<AuthenticationRepository>((ref) {
  var remoteDataSource = ref.watch(authRemoteDataSource);
  var localDataSource = ref.watch(authLocalDataSource);

  return AuthenticationRepositoryImpl(remoteDataSource, localDataSource);
});

var authUseCaseProvider = Provider<UseCase>((ref) {
  var authRepository = ref.watch(authRepoProvider);

  return AuthUseCase(authRepository);
});
