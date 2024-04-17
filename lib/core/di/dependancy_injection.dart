import 'package:flutter_revierpod_project_architecture/features/auth/presentation/controller/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/local/shared_prefs_storage_service.dart';
import '../data/local/storage_service.dart';

var localDbProvider = Provider<StorageService>((ref) {
  return SharedPrefsService();
});

// var authControllerProvider = Provider((ref) => AuthController());
