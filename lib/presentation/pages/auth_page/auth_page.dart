import 'package:flutter/material.dart';

import '../../widgets/auth_page_widget/auth_page_widgets.dart';

// Kurban 10-09-2023
// Kurban изменен 12.09.2023
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    void onPressed() {
      Navigator.of(context).pop();
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: onPressed, icon: const Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text('Sign in', 
            style: themeData.appBarTheme.titleTextStyle),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              HeaderTextWidget(),
              DiscriptionHeaderTextWidget(),
              SizedBox(height: 50),
              EmailTextFieldWidget(),
              SizedBox(height: 20),
              PasswordTextFieldWidget(),
              ForgotTextButtonWidget(),
              LoginElevatedButtonWidget(),
              SignUpRowWidget(),
              SizedBox(height: 15),
              DividerWidget(),
              SizedBox(height: 15),
              GoogleOutlinedButtonWidget(),
              SizedBox(height: 20),
              FacebookOutlineButtonWidget(),
              SizedBox(height: 20),
              SkipTextButtonWidget(),
            ],
          ),
        ));
  }
}
