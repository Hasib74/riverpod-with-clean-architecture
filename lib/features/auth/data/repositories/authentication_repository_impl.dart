

import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/models/response.dart';
import '../../../../core/exceptions/http_exception.dart';
import '../../domain/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/auth_local_data_source.dart';
import '../datasource/auth_remote_data_source.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthenticationRepositoryImpl(this.authRemoteDataSource , this.authLocalDataSource);

  @override
  Future<Either<AppException, Response>> loginUser({required Map<String,dynamic> user}) {
    return authRemoteDataSource.loginUser(user: user);
  }

  @override
  Future<Either<AppException, Response>> signUp({required Map<String,dynamic> user}) {
    // TODO: implement signUp

    return authRemoteDataSource.signUpUser(user: user);

  }

  @override
  Future<Either<AppException, Response>> saveToken({required String token}) {
    // TODO: implement saveToken


   return authLocalDataSource.saveToken(token);

  }
}
