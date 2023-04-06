import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode thememode = ThemeMode.dark;

  bool get isDarkMode => thememode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    thememode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyTheme {
  //***************Dark theme*********** *//
  static final darkTheme = ThemeData(
    // primaryColorDark: Colors.red,
    scaffoldBackgroundColor: const Color(0Xff001d3d),
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20)),
  );

  //***************Light theme*********** *//
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0Xffedede9),
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20)),
  );
}
