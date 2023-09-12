import 'package:flutter/material.dart';

class DiscriptionHeaderTextWidget extends StatelessWidget {
  const DiscriptionHeaderTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('DISCOVER AMAZING PLACES',
     style: TextStyle(
       fontSize: 10,
       letterSpacing: 2,
     ),
          );
  }
}

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('ArmeniaTour',
     style: TextStyle(
       fontSize: 30,
       height: 1.0,
          ),
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
              )
            ),
          );
  }
}

class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: TextField(
        decoration:InputDecoration(
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
              )
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
    return SizedBox(
      width: 328,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 197, 195, 195),),
            child: const Text('Forgot password?',
              style: TextStyle(decoration:TextDecoration.underline),), 
            onPressed: () {},
            
            ),
        ],
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
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SizedBox(
    width: double.infinity,
    child: ElevatedButton(
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(3.0),
          shadowColor: MaterialStateProperty.all(const Color(0xFF00C8FF)),
          backgroundColor: MaterialStateProperty.all(const Color(0xFF00C8FF)),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          )),
        ),
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


class SignUpRowWidget extends StatelessWidget {
  const SignUpRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328,
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Text("Don't have an account?"),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              ),
            foregroundColor: const Color(0xFF00C8FF),
            ),
            child: const Text('Sign up',
              style: TextStyle(
                fontWeight: FontWeight.normal ,
                fontSize: 14,
                decorationColor: Color(0xFF00C8FF),
                decoration:TextDecoration.underline),), 
            onPressed: () {},
            ),
      ],
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
      child: Row(
    children: [
        Expanded(
            child: Divider(
              color: Colors.black12,
            )
        ),       
        Text("  or  "),        
        Expanded(
            child: Divider(
              color: Colors.black12
            )
            ),
          ]
        )
      );
  }
}

class GoogleOutlinedButtonWidget extends StatelessWidget {
  const GoogleOutlinedButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SizedBox(
    width: double.infinity,
    child: OutlinedButton.icon(
       icon: const Icon(
        Icons.g_translate_sharp, 
        color: Colors.blue,
        size: 20,),
       label: const Text('Continue with Google', 
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black),),
        style: ButtonStyle(
          side: MaterialStateProperty.all(const BorderSide(
            color: Colors.black12,
          )),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          )
          ),
        ),
        onPressed: () {},
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
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SizedBox(
    width: double.infinity,
    child: OutlinedButton.icon(
       icon: const Icon(
        Icons.facebook, 
        color: Colors.blue,
        size: 20,),
       label: const Text('Continue with Facebook', 
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black),),
        style: ButtonStyle(
          side: MaterialStateProperty.all(const BorderSide(
            color: Colors.black12
          )),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          )
          ),
        ),
        onPressed: () {},
            ),
          ),
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
    return SizedBox(
      width: 328,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 197, 195, 195),),
            child: const Text('SKIP',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                decoration:TextDecoration.underline),), 
            onPressed: () {},
            
            ),
        ],
      ),
    );
  }
}