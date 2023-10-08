import 'package:flutter/material.dart';

import '../../../widgets/auth_page_widgets/reset_widget/reset_widget.dart';

//02-10-2023
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    void onPressed() {
      Navigator.of(context).pop();
    }

    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
              onPressed: onPressed, 
              icon: const Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text(
            'Reset', 
            style: themeData.appBarTheme.titleTextStyle),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ResetImage(),
              SizedBox(height: 10),
              HeadingTextAndDesciption(),
              SizedBox(height: 40),
              FormWidgets(),
            ],
          ),
        ));
  }
}

