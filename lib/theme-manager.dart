import 'package:flutter/material.dart';
import './storage-manager.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      accentColor: Colors.white,
      accentIconTheme: IconThemeData(color: Colors.black),
      dividerColor: Colors.black12);

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );
  String themeName = 'light';

  ThemeData _themeData = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      accentColor: Colors.black,
      accentIconTheme: IconThemeData(color: Colors.white),
      dividerColor: Colors.white54);
  ThemeData getThemeData() {
    return _themeData;
  }

  ThemeNotifier() {
    StorageManager.getData("themeMode").then((value) {
      print('value read from ${value.toString()}');
      var themeData = value ?? "light";
      themeName = themeData;
      if (themeData == 'light') {
        _themeData = lightTheme;
      } else {
        print('Dark Mode ON');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }
  void setLightMode() {
    _themeData = lightTheme;
    themeName = "light";
    StorageManager.saveData("themeMode", 'light');
    notifyListeners();
  }

  void setDarkMode() {
    _themeData = darkTheme;
    themeName = 'dark';
    StorageManager.saveData("themeMode", 'dark');
    notifyListeners();
  }
}
