import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;

  ThemeMode get themeMode => _mode;

  bool isDark() => _mode == ThemeMode.dark;

  void changeMode() {
    if (_mode == ThemeMode.dark) {
      _mode = ThemeMode.light;
    } else {
      _mode = ThemeMode.dark;
    }
    notifyListeners();
  }

  void setMode(ThemeMode mode) async {
    _mode = mode;
    notifyListeners();
  }
}
