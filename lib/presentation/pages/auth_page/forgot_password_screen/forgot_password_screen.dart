import 'package:flutter/material.dart';
import '../../../widgets/auth_page_widgets/forgot_password_widget/forgot_password_widget.dart';

//02-10-2023
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
            'Forgot', 
            style: themeData.appBarTheme.titleTextStyle),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ForgotImage(),
              SizedBox(height: 30),
              HeadingTextAndDesciption(),
              SizedBox(height: 50),
              FormWidgets(),
            ],
          ),
        ));
  }
}


class ForgotImage extends StatelessWidget {
  const ForgotImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: Image.asset('lib/asset/image/forgot.png'),
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
          Text('Forgot password?',
          style: TextStyle(
            fontSize: 18
          ),),
          SizedBox(height: 5),
          Text(
            'Don\'t worry it happens. Please enter email associated with your account.',
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