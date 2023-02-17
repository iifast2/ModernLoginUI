import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});



  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user up method
  void signUserUp() async {


    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try creating the user

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {


      // WRONG EMAIL :
      if (e.code == 'user-not-found') {
        // show error to user
        wrongEmailMessage();
        print('No user found for that email !!!!');
        // WRONG PASSWORD :
      } else if (e.code == 'wrong-password') {
        // show error to user
        wrongPasswordMessage();
        print('Wrong password !!!!');
      }
    }
     Navigator.pop(context);
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Password'),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // stack the logo image over the rest of the content
                Stack(
                  children: [
                    // logo
                    Positioned(
                      right: 5,
                      child: Image.asset(
                        'lib/images/theteamlogo.png',
                        height: 40,
                      ),
                    ),
                    // the rest of the content

                    Column(
                      children: [
                        const SizedBox(height: 50),

                        const Icon(
                          Icons.account_box_rounded,
                          size: 100,
                        ),
                        const SizedBox(height: 50),
                        // welcome back, you've been missed!
                        Text(
                          'Let\'s create an account for you!',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 25),
                        // email textfield
                        MyTextField(
                          controller: emailController,
                          hintText: 'Email',
                          obscureText: false,
                        ),
                        const SizedBox(height: 10),

                        // password textfield
                        MyTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: true,
                        ),

                        const SizedBox(height: 10),

                        // confirm password textfield
                        MyTextField(
                          controller: passwordController,
                          hintText: 'Confirm Password',
                          obscureText: true,
                        ),


                        const SizedBox(height: 10),



                        // forgot password?
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),


                        const SizedBox(height: 25),


                        // sign in button
                        MyButton(
                          text: "Sign up",
                          onTap: signUserUp,
                        ),


                        const SizedBox(height: 50),



                        const SizedBox(height: 30),



                        // Already a member? Sign in now / Login Now !
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already a member?',
                              style: TextStyle(color: Colors.grey[700]),
                            ),



                            const SizedBox(width: 4),

                            GestureDetector(

                              onTap: widget.onTap,

                              child: const Text(
                                'Login now',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),



                          ],
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
