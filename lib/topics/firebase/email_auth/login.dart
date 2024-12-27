import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/topics/firebase/email_auth/signup.dart';

import 'homescreen.dart';
import 'my_firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                 hintText: 'Enter Email'
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Enter Password'
                ),
              ),
              FilledButton(onPressed: () async{

                UserCredential? user = await loginWithEmail(email: emailController.text, password: passwordController.text);

                if(user != null){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                }else{
                  print('failed to LOGIN');
                }

              }, child: Text('Login')),
              FilledButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
              }, child: Text('Go to signin'))
            ],
          ),
        ),
      ),
    );
  }
}
