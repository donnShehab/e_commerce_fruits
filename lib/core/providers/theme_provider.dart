import 'package:flutter/material.dart';
import 'package:e_coomerce_fruit/core/services/shared_preferences_singleton.dart'; // أو مكان Prefs عندك

class ThemeProvider extends ChangeNotifier {
  static const String _kPrefKey = 'isDarkMode';

  bool _isDark = false;
  bool get isDark => _isDark;

  ThemeProvider() {
    _loadFromPrefs();
  }

  void _loadFromPrefs() {
    // Prefs.init() مفعل في main قبل إنشاء الـ provider
    final value = Prefs.getBool(_kPrefKey) ?? false;
    _isDark = value;
    notifyListeners();
  }

  Future<void> _saveToPrefs() async {
    await Prefs.setBool(_kPrefKey, _isDark);
  }

  void toggleTheme([bool? value]) {
    if (value != null) {
      _isDark = value;
    } else {
      _isDark = !_isDark;
    }
    _saveToPrefs();
    
    notifyListeners();
  }
}

