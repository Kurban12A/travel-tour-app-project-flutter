import 'package:flutter/material.dart';
// Kurban 09-09-2023
//переменная которая будет хранить тему нашего приложения
final primaryColor = Color(0xFF00C8FF);
final themeData = ThemeData(
  primaryColor: primaryColor,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
  useMaterial3: true,
);