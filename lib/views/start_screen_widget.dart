import 'package:flutter/material.dart';
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
            _StartFullScreenImageWidget(),
            _StartTextWidget(),
            _StartElevatedButtonWidget(),
            ]),
    );       
  }
}


// виджет отвечающий за кнопку на стартовом экране
// TODO поработать над кнопкой
class _StartElevatedButtonWidget extends StatelessWidget {
  const _StartElevatedButtonWidget({super.key});


  @override
  Widget build(BuildContext context) {

    // route на второй экран
    void onPressed() {
      Navigator.pushNamed(context, '/auth');
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 148, vertical: 15)),
            onPressed: onPressed,
            child: const Text(
            'Start',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black),),
        ),
      ),
    );
  }
}

// Виджет отвеающий за стартовое изображение на экране
class _StartFullScreenImageWidget extends StatelessWidget {
  const _StartFullScreenImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Image.asset('lib/asset/khor-virap.jpg',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,)
    );
  }
}

// виджет отвечающий за текст на стартовой странице
class _StartTextWidget extends StatelessWidget {
  const _StartTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 550,),
           Text('Find new places',
           textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 18,),
          Text('Travel around the world with just\na tap and enjoy your holiday',
          textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.white,),
          ),
        ],
      ),
    );
  }
}


