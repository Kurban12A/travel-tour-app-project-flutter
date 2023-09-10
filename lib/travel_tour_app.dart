import 'package:app_armenia_tour/route/routes.dart';
import 'package:app_armenia_tour/theme/theme_data.dart';
import 'package:flutter/material.dart';
// Kurban 09-09-2023
class TravelTourApp extends StatelessWidget {
  const TravelTourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      routes: routes,
    );
  }
}
