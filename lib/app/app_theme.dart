import 'package:flutter/material.dart';

class AppTheme {
  // 라이트 테마 정의
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    primaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold), // headline1 -> displayLarge
      displayMedium: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w600), // headline2 -> displayMedium
      bodyLarge: TextStyle(
          fontSize: 16.0, color: Colors.black), // bodyText1 -> bodyLarge
      bodyMedium: TextStyle(
          fontSize: 14.0, color: Colors.black54), // bodyText2 -> bodyMedium
      titleMedium: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500), // subtitle1 -> titleMedium
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blueAccent,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  // 다크 테마 정의
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    primaryColor: Colors.deepPurpleAccent,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurpleAccent,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
      displayMedium: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white70),
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white60),
      titleMedium: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurpleAccent,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // 공통 색상 정의
  static const Color primaryColor = Colors.blueAccent;
  static const Color secondaryColor = Colors.amber;
  static const Color backgroundColor = Colors.white;
  static const Color darkBackgroundColor = Colors.black;

  // 경계선 스타일 등 추가 정의 가능
  static const BorderSide defaultBorder =
      BorderSide(color: Colors.grey, width: 1.0);
}
