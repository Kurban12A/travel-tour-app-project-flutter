import 'package:flutter/material.dart';

// 28-09-2023 декомпозирован отдельный виджет кнопки Get Started 
// 28-09-2023 вынесены стили в переменные
// Виджет отвеающий за стартовое изображение на экране
class StartFullScreenImageWidget extends StatelessWidget {
  const StartFullScreenImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.asset(
      'lib/asset/image/khor-virap.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    ));
  }
}

// виджет отвечающий за текст на стартовой странице
class StartFormWidget extends StatelessWidget {
  const StartFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;
    const largeTextStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: color,
    );
    const mediumTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color,
    );
    const buttonTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Color.fromARGB(255, 0, 0, 0));
    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      shadowColor: MaterialStateProperty.all(Colors.white),
    );

    void onPressed() {
      Navigator.pushReplacementNamed(context, '/auth');
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Find new places',
            style: largeTextStyle,
          ),
          const SizedBox(
            width: 18,
          ),
          const Text(
            'Travel around the world with just\na tap and enjoy your holiday',
            style: mediumTextStyle,
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: buttonStyle,
              onPressed: onPressed,
              child: const Text(
                'Get Started',
                style: buttonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
