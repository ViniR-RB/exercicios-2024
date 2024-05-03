import 'package:flutter/material.dart';

sealed class AppTheme {
  static const Color _appBarColor = Color(0xFF446088);
  static const Color scaffoldBackgroundColor = Color(0xFFFFFFFF);
  static final ThemeData _theme = ThemeData(
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: _appBarColor,
    ),
  );

  static ThemeData get theme => _theme;

  static TextStyle titleStyle = const TextStyle(
      fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold);
}
