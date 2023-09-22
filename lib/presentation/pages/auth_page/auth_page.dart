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
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              HeaderTextWidget(),
              DiscriptionHeaderTextWidget(),
              SizedBox(height: 15),
              FormWidgets(),
              SizedBox(height: 5),
              SignUpRowWidget(),
              SizedBox(height: 10),
              DividerWidget(),
              SizedBox(height: 20),
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
