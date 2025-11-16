// import 'package:flutter/material.dart';
// import 'package:e_coomerce_fruit/core/services/shared_preferences_singleton.dart';

// class LocaleProvider extends ChangeNotifier {
//   static const String _kLocaleKey = 'appLocale';

//   Locale _locale = const Locale('ar');
//   Locale get locale => _locale;

//   LocaleProvider() {
//     _loadLocale();
//   }

//   void _loadLocale() {
//     final savedLang = Prefs.getString(_kLocaleKey);

//     if (savedLang != null) {
//       _locale = Locale(savedLang);
//     } else {
//       _locale = const Locale('ar');
//     }
//     notifyListeners();
//   }

//   Future<void> _saveLocale(String langCode) async {
//     await Prefs.setString(_kLocaleKey, langCode);
//   }

//   void changeLocale(String langCode) {
//     _locale = Locale(langCode);
//     _saveLocale(langCode);
//     notifyListeners();
//   }
// }
