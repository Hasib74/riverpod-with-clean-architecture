import 'package:equatable/equatable.dart';
import 'package:flutter_revierpod_project_architecture/core/domain/models/response.dart';
import 'package:flutter_revierpod_project_architecture/core/exceptions/http_exception.dart';
import 'package:flutter_revierpod_project_architecture/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_revierpod_project_architecture/features/auth/presentation/providers/state/auth_state.dart';
import 'package:fpdart/src/either.dart';

import '../../../../core/usecase/use_case.dart';

class AuthUseCase extends UseCase<Either<AppException, Response>, Params> {
  AuthenticationRepository authenticationRepository;

  AuthUseCase(this.authenticationRepository);

  @override
  Future<Either<AppException, Response>> call(Params params) {
    if (params is SignInRequestParams) {
      return authenticationRepository.loginUser(user: params.body!);
    } else if (params is SaveTokenParams) {
      return authenticationRepository.saveToken(token: params.token!);
    } else {
      throw UnimplementedError();
    }
  }
}

class Params extends Equatable {
  final Map? body;

  Params({this.body});

  @override
  List<Object> get props => [body!];
}

class SignInRequestParams extends Params {
  @override
  Map<String, dynamic>? body;

  SignInRequestParams(this.body);

  @override
  // TODO: implement props
  List<Object> get props => [body!];
}

class SaveTokenParams extends Params {
  String token;

  SaveTokenParams(this.token);

  @override
  // TODO: implement props
  List<Object> get props => [token];
}
