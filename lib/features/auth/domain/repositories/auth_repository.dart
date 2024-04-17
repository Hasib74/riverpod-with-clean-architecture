import 'package:flutter_revierpod_project_architecture/core/domain/models/response.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/exceptions/http_exception.dart';
import '../models/user_model.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, Response>> loginUser({required Map<String,dynamic> user});
  Future<Either<AppException, Response>> signUp({required Map<String,dynamic> user});
  Future<Either<AppException ,Response>> saveToken({required String token});
}
