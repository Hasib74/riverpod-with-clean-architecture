import 'package:flutter_revierpod_project_architecture/features/auth/presentation/screen/sign_in_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/presentation/splash_screen.dart';

const String splashScreen = "/splashScreen";
const String authScreen = "/authScreen";
const String signInScreen = "/signIn";

var goRouter =
    GoRouter(debugLogDiagnostics: true, initialLocation: splashScreen, routes: [
    GoRoute(path: splashScreen, builder: (context, state) => const SplashScreen()),
    GoRoute(path: signInScreen, builder: (context, state) =>  SignInScreen()),
]);

class RouterPath {
  static const String splashScreenPath = splashScreen;
  static const String authScreenPath = authScreen;
  static const String signInScreenPath = signInScreen;
}
