import 'package:flutter/material.dart';


class DiscriptionHeaderTextWidget extends StatelessWidget {
  const DiscriptionHeaderTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Text(
      'DISCOVER AMAZING PLACES',
      style: themeData.textTheme.bodySmall,
    );
  }
}


class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Text(
      'TravelTour',
      style: themeData.textTheme.headlineLarge,
    );
  }
}

class FormWidgets extends StatefulWidget {
  const FormWidgets({super.key});

  @override
  State<FormWidgets> createState() => _FormWidgetsState();
}

class _FormWidgetsState extends State<FormWidgets> {

  // обращаемся к контроллерам и берем у них введеный текст
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText = null;

  // реализована заглушка для авторизации и переход на главный экран
  void _authorization() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    // пока выставляем заглушку чтобы перейти на главный экран
    if (login == 'admin' && password == 'admin') {
      // если errorText = null то ничего не выводим
      errorText = null;
      Navigator.pushReplacementNamed(context, '/mainscreen');
    } else {
      // если errorText != null то выводим сообщение об ошибке
      errorText = 'Invalid username or password';
    }

    // обновление состояния виджетов
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    
    final themeData = Theme.of(context);
    final errorText = this.errorText;
    const loginTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Color.fromARGB(255, 255, 255, 255));

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: [
          // ...[] нужен чтобы поместить в массив виджеты
          if (errorText != null) ...[
            _ErrorWidget(errorText: errorText),
            const SizedBox(height: 5)
          ],
          _UserNameWidget(
              loginTextController: _loginTextController, 
              themeData: themeData),
          const SizedBox(height: 20),
          _PasswordWidget(
              passwordTextController: _passwordTextController,
              themeData: themeData),
          const SizedBox( height: 5),
          _ForgotPasswordWidget(themeData: themeData),
          const SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: themeData.elevatedButtonTheme.style,
              onPressed: _authorization,
              child: const Text(
                'Log in',
                style: loginTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _ForgotPasswordWidget extends StatelessWidget {
  const _ForgotPasswordWidget({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          style: themeData.textButtonTheme.style,
          child: const Text('Forgot password?'),
          onPressed: () {},
        ),
      ],
    );
  }
}


class _PasswordWidget extends StatelessWidget {
  const _PasswordWidget({
    super.key,
    required TextEditingController passwordTextController,
    required this.themeData,
  }) : _passwordTextController = passwordTextController;

  final TextEditingController _passwordTextController;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    const inputDecorationTheme = InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: Color(0xFF00C8FF))),
      floatingLabelStyle: TextStyle(color: Color(0xFF00C8FF)),
      label: Text('password'),
      labelStyle: TextStyle(color: Color.fromARGB(255, 226, 221, 221)),
      isCollapsed: true,
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        borderSide: BorderSide(
          color: Color(0xFFE0E0E0),
        ),
      ),
    );

    return TextField(
      controller: _passwordTextController,
      obscureText: true,
      cursorColor: themeData.colorScheme.secondary,
      decoration: inputDecorationTheme,
    );
  }
}


class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    super.key,
    required TextEditingController loginTextController,
    required this.themeData,
  }) : _loginTextController = loginTextController;

  final TextEditingController _loginTextController;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    const inputDecorationTheme = InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF00C8FF)),
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      floatingLabelStyle: TextStyle(color: Color(0xFF00C8FF)),
      label: Text('username'),
      labelStyle: TextStyle(color: Color.fromARGB(255, 226, 221, 221)),
      isCollapsed: true,
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        borderSide:
            BorderSide(color: Color(0xFFE0E0E0), style: BorderStyle.solid),
      ),
    );

    return TextField(
      controller: _loginTextController,
      cursorColor: themeData.colorScheme.secondary,
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


class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 328,
        height: 45,
        child: Row(
          children: [
            Expanded(
                child: Divider(
              color: Colors.black12,
            )),
            Text(
              "  or  ",
              style: TextStyle(
                fontWeight: FontWeight.normal),
            ),
            Expanded(child: Divider(
              color: Colors.black12)),
          ]));
  }
}


class GoogleOutlinedButtonWidget extends StatelessWidget {
  const GoogleOutlinedButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            style: themeData.outlinedButtonTheme.style,
            onPressed: () {},
            icon: Icon(
              Icons.g_translate_sharp,
              color: themeData.colorScheme.secondary,
              size: 20,
            ),
            label: Text(
              'Continue with Google',
              style: themeData.textTheme.headlineMedium,
            ),
          ),
        ),
      ),
    );
  }
}


class FacebookOutlineButtonWidget extends StatelessWidget {
  const FacebookOutlineButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            style: themeData.outlinedButtonTheme.style,
            onPressed: () {},
            icon: Icon(
              Icons.facebook,
              color: themeData.colorScheme.secondary,
              size: 20,
            ),
            label: Text(
              'Continue with Facebook',
              style: themeData.textTheme.headlineMedium,
            ),
          ),
        ),
      ),
    );
  }
}


class SignUpRowWidget extends StatelessWidget {
  const SignUpRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const textColor = TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        decorationColor: Color(0xFF00C8FF),
        decoration: TextDecoration.underline);

    return SizedBox(
      width: 328,
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't have an account?",
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              foregroundColor: const Color(0xFF00C8FF),
            ),
            child: const Text('Sign up', style: textColor),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}


class SkipTextButtonWidget extends StatefulWidget {
  const SkipTextButtonWidget({
    super.key,
  });

  @override
  State<SkipTextButtonWidget> createState() => _SkipTextButtonWidgetState();
}

class _SkipTextButtonWidgetState extends State<SkipTextButtonWidget> {

  void onPressed () {
    Navigator.pushReplacementNamed(context, '/mainscreen');
  }

  @override
  Widget build(BuildContext context) {

    final themeData = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: themeData.textButtonTheme.style,
          onPressed: onPressed,
          child: const Text('SKIP'),
        ),
      ],
    );
  }
}
