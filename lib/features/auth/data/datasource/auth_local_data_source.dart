import 'package:flutter_revierpod_project_architecture/core/domain/models/response.dart';
import 'package:flutter_revierpod_project_architecture/core/exceptions/http_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/di/dependancy_injection.dart';

abstract class AuthLocalDataSource {
  Future<Either<AppException, Response>> saveToken(String token);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<Either<AppException, Response>> saveToken(String token) {
    try {
      ProviderContainer().read(localDbProvider).set("token", token);

      return Future.value(Right(Response(data: token, statusCode: 200)));
    } catch (e) {
      return Future.value(Left(AppException(
          message: e.toString(), statusCode: 404, identifier: '')));
    }
  }
}
