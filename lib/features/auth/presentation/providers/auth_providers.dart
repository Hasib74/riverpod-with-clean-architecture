import 'package:flutter_revierpod_project_architecture/features/auth/domain/provider/auth_repo_provider.dart';
import 'package:flutter_revierpod_project_architecture/features/auth/presentation/providers/state/auth_notifier.dart';
import 'package:flutter_revierpod_project_architecture/features/auth/presentation/providers/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    var authUseCase = ref.watch(authUseCaseProvider);

    return AuthNotifier(authUseCase: authUseCase);
  },
);
