import 'package:flutter/material.dart';
import '../../widgets/start_pages_widget/start_page_widgets.dart';

// Kurban 09-09-2023
// 28-09-2023 исключен StartElevatedButtonWidget()
// Виджет стартовой страницы принимающий в стеке виджеты
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          StartFullScreenImageWidget(),
          StartFormWidget(),
        ]
      ),
    );
  }
}
