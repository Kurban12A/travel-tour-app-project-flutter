import 'package:flutter/material.dart';

// виджет отвечающий за кнопку на стартовом экране
// TODO поработать над кнопкой
class StartElevatedButtonWidget extends StatelessWidget {
  const StartElevatedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {

    // route на второй экран
    void onPressed() {
      Navigator.pushReplacementNamed(context, '/auth');
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: onPressed,
            child: const Text(
              'Start',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ),
      ),
    );
  }
}

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
class StartTextWidget extends StatelessWidget {
  const StartTextWidget({super.key});

  @override
  Widget build(BuildContext context) {

    const color = Colors.white;

    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 550,
          ),
          Text(
            'Find new places',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(
            width: 18,
          ),
          Text(
            'Travel around the world with just\na tap and enjoy your holiday',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: color,
            ),
          ),
          
        ],
      ),
    );
  }
}
