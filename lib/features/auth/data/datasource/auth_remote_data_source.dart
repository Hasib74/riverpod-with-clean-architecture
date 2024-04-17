

import 'package:fpdart/fpdart.dart';

import '../../../../core/data/remote/network_service.dart';
import '../../../../core/domain/models/response.dart';
import '../../../../core/exceptions/http_exception.dart';
import '../../domain/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either<AppException, Response>> loginUser({required Map<String,dynamic> user});
  Future<Either<AppException, Response>> signUpUser({required Map<String,dynamic> user});
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final NetworkService networkService;

  AuthRemoteDataSourceImp(this.networkService);

  @override
  Future<Either<AppException, Response>> loginUser({required Map<String,dynamic>? user}) async {
    try {
      final eitherType = await networkService.post(
        '/auth/login',
        data:  user,
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          final user = User.fromJson(response.data);
          // update the token for requests
          networkService.updateHeader(
            {'Authorization': user.token},
          );

          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: '${e.toString()}\nAuthRemoteDataSource.loginUser',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Response>> signUpUser({required Map<String, dynamic> user}) {
    // TODO: implement signUpUser
    throw UnimplementedError();
  }
}
