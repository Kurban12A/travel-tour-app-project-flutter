
import 'package:flutter/material.dart';


// Kurban 10-09-2023
class AuthScreenWidget extends StatelessWidget {
  const AuthScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            _AuthAppBarTextWidget(),
            _AuthOutlineButtonWidget()
          ],
        ),
      ),
      body: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5, vertical: 5,
                ),
                child: Text('ArmeniaTour', 
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.start,),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('DISCOVER AMAZING PLACES', textAlign: TextAlign.center,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// виджет отвечающий за AppBar кнопку выбора языка
class _AuthOutlineButtonWidget extends StatelessWidget {
  const _AuthOutlineButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        foregroundColor: MaterialStateProperty.all(Colors.blue)
      ),
      child: const Text('English'),
      onPressed: (){},
      );
  }
}


// виджет отвечающий за текст в appbar
class _AuthAppBarTextWidget extends StatelessWidget {
  const _AuthAppBarTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Text('Sign in',
      textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold),
          ),
    );
  }
}


