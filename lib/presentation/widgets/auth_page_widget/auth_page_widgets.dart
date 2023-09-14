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
      'ArmeniaTour',
      style: themeData.textTheme.headlineLarge,
    );
  }
}

class EmailTextFieldWidget extends StatelessWidget {
  const EmailTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: TextField(
          decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00C8FF)),
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        floatingLabelStyle: TextStyle(color: Color(0xFF00C8FF)),
        labelText: AutofillHints.email,
        labelStyle: TextStyle(color: Color.fromARGB(255, 226, 221, 221)),
        isCollapsed: true,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14))),
      )),
    );
  }
}

class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: TextField(
        cursorColor: themeData.colorScheme.secondary,
        decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Color(0xFF00C8FF))),
            floatingLabelStyle: TextStyle(color: Color(0xFF00C8FF)),
            labelText: AutofillHints.password,
            labelStyle: TextStyle(color: Color.fromARGB(255, 226, 221, 221)),
            isCollapsed: true,
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
            )),
      ),
    );
  }
}

class LoginElevatedButtonWidget extends StatelessWidget {
  const LoginElevatedButtonWidget({
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
          child: ElevatedButton(
            style: themeData.elevatedButtonTheme.style,
            onPressed: () {},
            child: const Text(
              'Log in',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
      ),
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
        child: Row(children: [
          Expanded(
              child: Divider(
            color: Colors.black12,
          )),
          Text(
            "  or  ",
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          Expanded(child: Divider(color: Colors.black12)),
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

class ForgotTextButtonWidget extends StatelessWidget {
  const ForgotTextButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SizedBox(
      width: 328,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            style: themeData.textButtonTheme.style,
            child: const Text('Forgot password?'),
            onPressed: () {},
          ),
        ],
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

class SkipTextButtonWidget extends StatelessWidget {
  const SkipTextButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SizedBox(
      width: 328,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: themeData.textButtonTheme.style,
            child: const Text('SKIP'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
