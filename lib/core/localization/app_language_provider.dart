import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

var appLanguageProvider = StateNotifierProvider<AppLanguageProvider, Locale>(
    (ref) => AppLanguageProvider());

class AppLanguageProvider extends StateNotifier<Locale> {
  AppLanguageProvider() : super(const Locale('en', 'US'));

  void changeLanguage() async {
    Locale myLocale;

    if (state.countryCode!.toLowerCase().endsWith("bd")) {
      myLocale = const Locale('en', 'US');
    } else {
      myLocale = const Locale('bn', 'BD');
    }

    Intl.defaultLocale = myLocale.toString();

    state = myLocale;
  }
}
