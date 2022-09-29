import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.lightBlueAccent,
  ),
  scaffoldBackgroundColor: Colors.grey[100],
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    accentColor: Colors.lightBlueAccent,
  ),
  scaffoldBackgroundColor: Colors.black87,
);

class ThemeSettings with ChangeNotifier {
  bool _darkTheme = false;
  SharedPreferences? _preferences;

  bool get darkTheme => _darkTheme;

  ThemeSettings() {
    _loadSettingsFromPrefs();
  }

  _initializeprefs() async {
    // check if _preferences is null
    _preferences ??= await SharedPreferences.getInstance();
  }

  _loadSettingsFromPrefs() async {
    await _initializeprefs();
    _darkTheme = _preferences?.getBool("darkTheme") ?? false;
    notifyListeners();
  }

  _saveSettingsToPrefs() async {
    await _initializeprefs();
    _preferences?.setBool("darkTheme", _darkTheme);
  }

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveSettingsToPrefs();
    notifyListeners();
  }
}
