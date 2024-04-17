import 'package:equatable/equatable.dart';
import 'package:flutter_revierpod_project_architecture/core/domain/models/response.dart';
import 'package:flutter_revierpod_project_architecture/core/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

import '../../features/auth/presentation/providers/state/auth_state.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}