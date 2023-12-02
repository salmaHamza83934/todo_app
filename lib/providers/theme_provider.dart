import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode theme = ThemeMode.light;

  changeTheme(ThemeMode mode) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    theme = mode;
    theme == ThemeMode.light
        ? pref.setBool('isLight', true)
        : pref.setBool('isLight', false);
    notifyListeners();
  }

  Future<void> loadTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isLight = pref.getBool('isLight');
    if (isLight != null) {
      theme = isLight ? ThemeMode.light : ThemeMode.dark;
      notifyListeners();
    }
  }
}
