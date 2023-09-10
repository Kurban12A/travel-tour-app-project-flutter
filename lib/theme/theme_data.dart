import 'package:flutter/material.dart';
// Kurban 09-09-2023
//переменная которая будет хранить тему нашего приложения
final themeData = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
  useMaterial3: true,
);