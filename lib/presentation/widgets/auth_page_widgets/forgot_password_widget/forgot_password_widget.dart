import 'package:flutter/material.dart';



class FormWidgets extends StatefulWidget {
  const FormWidgets({super.key});

  @override
  State<FormWidgets> createState() => _FormWidgetsState();
}

class _FormWidgetsState extends State<FormWidgets> {

  // реализована заглушка для авторизации и переход на главный экран
  void onPressed() {
    Navigator.pushNamed(context, '/signIn/forgotpassword/resetpassword');
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
          const _EmailWidget(),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: themeData.elevatedButtonTheme.style,
              onPressed: onPressed,
              child: const Text(
                'Send',
                style: loginTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmailWidget extends StatelessWidget {
  const _EmailWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    const inputDecorationTheme = InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF00C8FF)),
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      floatingLabelStyle: TextStyle(color: Color(0xFF00C8FF)),
      label: Text('email'),
      labelStyle: TextStyle(color: Color.fromARGB(255, 226, 221, 221)),
      isCollapsed: true,
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        borderSide:
            BorderSide(color: Color(0xFFE0E0E0), style: BorderStyle.solid),
      ),
    );

    return const TextField(
      decoration: inputDecorationTheme,
    );
  }
}


class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({
    super.key,
    required this.errorText,
  });

  final String? errorText;

  @override
  Widget build(BuildContext context) {

    const mediumErrorTextStyle = TextStyle(
        fontSize: 14, 
        fontWeight: FontWeight.normal, 
        color: Colors.red);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          errorText!,
          style: mediumErrorTextStyle,
        ),
      ],
    );
  }
}

