import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';


AppLocalizations? language(BuildContext context) =>
    AppLocalizations.of(context);

Future<bool> changeLanguage(BuildContext context,
    {String? languageCode, String? countryCode}) async {
  Locale myLocale;



  if (countryCode!.toLowerCase().endsWith("bd")) {
    myLocale = const Locale('en', 'US');
  } else {
    myLocale = const Locale('bn', 'BD');
  }
  const provider = AppLocalizations.delegate;

  await provider.load(myLocale);

  // await initializeMessages(locale.toString());
  Intl.defaultLocale = myLocale.toString();

  return true;
}
