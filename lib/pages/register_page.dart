import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
<<<<<<< Updated upstream
  const RegisterPage({super.key, required this.onTap});
=======

  const RegisterPage({Key? key, required this.onTap}) : super(key: key);
>>>>>>> Stashed changes



  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
<<<<<<< Updated upstream

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
=======
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  String? initialCountry = 'US';

  void signUserUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match.'),
          duration: Duration(seconds: 3),
        ),
>>>>>>> Stashed changes
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

<<<<<<< Updated upstream
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


=======
  void signUserUpErrorMessages(FirebaseAuthException e, BuildContext context) {
    String errorMessage = '';

    if (e.code == 'weak-password') {
      errorMessage = 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      errorMessage = 'The account already exists for that email.';
    } else if (e.code == 'invalid-email') {
      errorMessage = 'The email address is not valid.';
    } else if (e.code == 'user-not-found') {
      errorMessage = 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      errorMessage = 'Wrong password provided for that user.';
    } else if (e.code == 'user-disabled') {
      errorMessage = 'The user account has been disabled.';
    } else {
      errorMessage = 'An undefined error happened.';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        duration: Duration(seconds: 3),
      ),
    );
  }

>>>>>>> Stashed changes
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
                Stack(
                  children: [
                    Positioned(
                      right: 5,
                      child: Image.asset(
                        'lib/images/theteamlogo.png',
                        height: 40,
                      ),
                    ),
<<<<<<< Updated upstream
                    // the rest of the content
=======

>>>>>>> Stashed changes

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
