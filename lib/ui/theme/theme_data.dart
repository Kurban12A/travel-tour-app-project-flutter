import 'package:flutter/material.dart';

// Kurban 09-09-2023
//переменная которая будет хранить тему нашего приложения
const primaryColor = Color(0xFF00C8FF);
const hintColor = Color.fromARGB(255, 168, 170, 171);


final themeData = ThemeData(

  
  primaryColor: primaryColor,
  hintColor: hintColor,

  // тема  appBarTheme(вверхняя панель) в приложении
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    color: Colors.white,
  ),


  // тема  bottomNavigationBarTheme (нижняя панель) в приложении
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: primaryColor,
    landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
    unselectedItemColor: hintColor,
    selectedLabelStyle:
      TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
    ),
  

  // тема текста в приложении
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      height: 1.0,
    ),
    headlineMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
    bodySmall: TextStyle(
      fontSize: 10,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black),
  ),


  // тема кнопок в приложении
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: const MaterialStatePropertyAll(3.0),
      shadowColor: MaterialStateProperty.all(primaryColor),
      backgroundColor: MaterialStateProperty.all(primaryColor),
      padding:
          MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0))),
    ),
  ),


  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      side: MaterialStateProperty.all(const BorderSide(
        color: Colors.black12,
      )),
      padding:
          MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      )),
    ),
  ),


  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 197, 195, 195)),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.underline),
        )),
  ),


  // общая цветовая тема экранов
  scaffoldBackgroundColor: Colors.white,
  // цвет для текста и кнопок
  colorScheme:
      ColorScheme.fromSeed(seedColor: Colors.black, secondary: primaryColor),
  useMaterial3: true,
);
