import 'package:flutter/material.dart';
import 'package:flutter_revierpod_project_architecture/core/config/router_config.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3))
        .then((value) => context.push(RouterPath.signInScreenPath));
    return const Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
