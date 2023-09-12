
import 'package:flutter/material.dart';


// Kurban 10-09-2023
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
        child:  Column(
          children: [
          SizedBox(height: 10,),
          Text('ArmeniaTour',
            style: TextStyle(
              fontSize: 30,
              height: 1.0,
          ),
          ),
          Text('DISCOVER AMAZING PLACES',
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: TextField(
              decoration: InputDecoration(
                labelText: AutofillHints.email,
                labelStyle: TextStyle(color: Color.fromARGB(255, 226, 221, 221)),
                isCollapsed: true,
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  borderSide: BorderSide(color: Colors.blueAccent),
                    )
                  ),
                ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: TextField(
              decoration:InputDecoration(
                labelText: AutofillHints.password,
                labelStyle: TextStyle(color: Color.fromARGB(255, 226, 221, 221)),
                isCollapsed: true,
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  borderSide: BorderSide(color: Colors.blueAccent),
                    )
                  ),
                ),
          ),
        ],
        ),
      )

    );
  }
}
