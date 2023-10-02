import 'package:flutter/material.dart';
import '../../../widgets/auth_page_widgets/sign_up_widget/sign_up_widget.dart';

// Kurban 02-10-2023
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    void onPressed() {
      Navigator.of(context).pop();
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: onPressed, 
              icon: const Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text(
            'Sign up', 
            style: themeData.appBarTheme.titleTextStyle),
        ),
        body: const SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              HeaderTextWidget(),
              DiscriptionHeaderTextWidget(),
              SizedBox(height: 25),
              FormWidgets(),
              SizedBox(height: 15),
              DividerWidget(),
              SizedBox(height: 10),
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