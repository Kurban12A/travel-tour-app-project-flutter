import 'package:flutter/material.dart';

import '../../../widgets/auth_page_widgets/success_widget/success_widget.dart';

//02-10-2023
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

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
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SuccessImage(),
              HeadingTextAndDesciption(),
              SizedBox(height: 30),
              FormWidgets(),
            ],
          ),
        ));
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