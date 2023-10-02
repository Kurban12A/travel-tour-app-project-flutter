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


class ResetImage extends StatelessWidget {
  const ResetImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: Image.asset('lib/asset/image/reset.png'),
    );
  }
}

class HeadingTextAndDesciption extends StatelessWidget {
  const HeadingTextAndDesciption({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text('Reset your password',
          style: TextStyle(
            fontSize: 18
          ),),
          SizedBox(height: 5),
          Text(
            'Now you can reset your old password',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black87,
            ),)
        ],
      ),
    );
  }
}