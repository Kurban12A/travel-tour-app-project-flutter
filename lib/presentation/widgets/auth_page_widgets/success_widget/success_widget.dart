import 'package:flutter/material.dart';

class FormWidgets extends StatefulWidget {
  const FormWidgets({super.key});

  @override
  State<FormWidgets> createState() => _FormWidgetsState();
}

class _FormWidgetsState extends State<FormWidgets> {


  // реализована заглушка для авторизации и переход на главный экран
  void onPressed() {
    Navigator.pushReplacementNamed(context, '/mainscreen');
  }

  @override
  Widget build(BuildContext context) {
    
    final themeData = Theme.of(context);
    const loginTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Color.fromARGB(255, 255, 255, 255));

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: themeData.elevatedButtonTheme.style,
              onPressed: onPressed,
              child: const Text(
                'Let\'s start',
                style: loginTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SuccessImage extends StatelessWidget {
  const SuccessImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: Image.asset('lib/asset/image/success.png'),
    );
  }
}

class HeadingTextAndDesciption extends StatelessWidget {
  const HeadingTextAndDesciption({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text('You\'re all set!',
      style: TextStyle(
        fontSize: 18
      ),),
    );
  }
}