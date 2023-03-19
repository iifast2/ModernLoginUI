import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/my_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

           const Padding(
             padding: EdgeInsets.symmetric(horizontal: 25.0),
             child: Text("Reset Your Password",
                textAlign: TextAlign.center,
                style: TextStyle(
                color: Colors.black,
                fontSize: 60,
              )
          ),
           ),

          const SizedBox(height: 10),

          Text("Enter your email and we will send you a password reset link !",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              )),

          const SizedBox(height: 50),

          MyTextField(
            controller: _emailController,
            hintText: 'Enter your Email: admin@gmail.com',
            obscureText: false,
          ),

          const SizedBox(height: 30),


          MyButton(
            text: "Reset Password",
            onTap: () {},
          ),
        ],



      ),
    );
  }
}
