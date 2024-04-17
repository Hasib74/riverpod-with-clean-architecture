import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_providers.dart';

class AuthController {
  GlobalKey<FormState> signInKey = GlobalKey();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signIn(WidgetRef ref) {
    if (signInKey.currentState?.validate() == true) {
      ref.read(authStateNotifierProvider.notifier).loginUser(
          emailTextEditingController.value.text, passwordController.value.text);
    }
  }
}
