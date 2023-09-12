
import 'package:flutter/material.dart';

import '../../widgets/auth_page_widget/auth_page_widgets.dart';



// Kurban 10-09-2023
// Kurban изменен 12.09.2023 
class AuthScreenWidget extends StatelessWidget {
  const AuthScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
  void onPressed () {
    Navigator.of(context).pop();
  }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: onPressed, 
          icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: const Text('Sign in', 
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold),),
      ),
      body: const Center(
        child: Column(
          children: [
           SizedBox(height: 10,),
           HeaderTextWidget(),
           DiscriptionHeaderTextWidget(),
           SizedBox(height: 30),
           EmailTextFieldWidget(),
           SizedBox(height: 20),
           //TODO(Ошибка в текстовых полях ),
           PasswordTextFieldWidget(),
           ForgotTextButtonWidget(),
           LoginElevatedButtonWidget(),
           SignUpRowWidget(),
           DividerWidget(),
           SizedBox(height: 10),
           GoogleOutlinedButtonWidget(),
           SizedBox(height: 20),
           FacebookOutlineButtonWidget(),
           SizedBox(height: 20),
           SkipTextButtonWidget(),
          ],
        ),
      )
    );
  }
}

