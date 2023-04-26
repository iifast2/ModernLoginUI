// lib/pages/login_or_register_page.dart
import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/login_page.dart';
import 'package:modernlogintute/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginOrRegisterPage extends StatefulWidget {
  final String? userId;

  LoginOrRegisterPage({Key? key, this.userId}) : super(key: key);

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  // initially show login page
  bool showLoginPage = true;



// toggle between the login and register page
  void togglePages(){

    setState(() {

      showLoginPage = !showLoginPage;

    });
  }


  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(
        onTap: togglePages,
      );
    }else{
      return RegisterPage(
          //userId: widget.userId!,
         onTap: togglePages,

      );
    }
  }

}
