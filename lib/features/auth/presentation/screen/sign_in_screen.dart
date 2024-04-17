import 'package:flutter/material.dart';
import 'package:flutter_revierpod_project_architecture/core/di/dependancy_injection.dart';
import 'package:flutter_revierpod_project_architecture/core/localization/language.dart';
import 'package:flutter_revierpod_project_architecture/features/auth/presentation/controller/auth_controller.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/auth_providers.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build

    var authController = AuthController();

    var authNotify = ref.watch(authStateNotifierProvider);

    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
              key: authController.signInKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: authController.emailTextEditingController,
                    validator: (String? value) {
                      if (value == null || value!.isEmpty) {
                        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                            const SnackBar(
                                content: Text("Email can not be empty")));
                      }
                    },
                  ),
                  const Gap(16),
                  TextFormField(
                    controller: authController.passwordController,
                    validator: (String? value) {
                      if (value == null || value!.isEmpty) {
                        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                            const SnackBar(
                                content: Text("Email can not be empty")));
                      }
                    },
                  )
                ],
              )),
          const Gap(16),
          authNotify.maybeMap(
            loading: (_) => const Center(child: CircularProgressIndicator()),
            orElse: () => loginButton(context, authController, ref),
          ),
        ],
      ),
    );
  }

  loginButton(
      BuildContext context, AuthController authController, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {
          authController.signIn(ref);
        },
        child: Text("Sign IN"));
  }
}
