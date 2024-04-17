import 'package:flutter_revierpod_project_architecture/core/usecase/use_case.dart';
import 'package:flutter_revierpod_project_architecture/features/auth/domain/usecase/auth_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/exceptions/http_exception.dart';

import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final UseCase authUseCase;

  AuthNotifier({
    required this.authUseCase,
  }) : super(const AuthState.initial());

  Future<void> loginUser(String username, String password) async {
    state = const AuthState.loading();

    await Future.delayed(Duration(seconds: 3));

    Map<String, dynamic> body = {
      "email": "hasibakon74@gmail.com",
      "password": "123456"
    };

    final response = await authUseCase.call(SignInRequestParams(body));

    state = await response.fold(
      (failure) => AuthState.failure(failure),
      (user) async {
        final response =
            await authUseCase.call(SaveTokenParams(user.data["token"]));

        if (response.hashCode == 200) {
          return const AuthState.success();
        }
        return AuthState.failure(CacheFailureException());
      },
    );
  }
}
