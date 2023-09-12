import 'package:flutter/material.dart';
import '../../widgets/start_pages_widget/start_page_widgets.dart';

// Kurban 09-09-2023
// Виджет стартовой страницы принимающий в стеке виджеты 
class StartScreenWidget extends StatelessWidget {
  const StartScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
        Stack(
          children:[ 
            StartFullScreenImageWidget(),
            StartTextWidget(),
            StartElevatedButtonWidget(),
            ]),
    );       
  }
}





