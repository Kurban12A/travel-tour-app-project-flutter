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


