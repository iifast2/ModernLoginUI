import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';
import 'package:lottie/lottie.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modernlogintute/services/auth_service.dart';
import 'package:modernlogintute/pages/forgot_pwd_page.dart';
import 'package:flutter/services.dart';
import 'package:modernlogintute/pages/anonymous_home_page.dart';
import 'package:modernlogintute/pages/home_page.dart';


class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Press Enter to Login :
  final FocusNode _focusNode = FocusNode();

  // Sing in Validator Key :
  final _formKey = GlobalKey<FormState>();


  @override
  void dispose(){

    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }




//  Sign in Anonymously - Start //
  void signInAnonymously() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'An unknown error occurred.'),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
    Navigator.pop(context);
  }

//  Sign in Anonymously - End  //


  void showValidationMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.redAccent,
      ),
    );
  }


//  Sign in Exceptions & Validators - Start //

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    return emailRegex.hasMatch(email);
  }

  void networkIssueMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Network issue, please check your internet connection'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.purpleAccent,
      ),
    );
  }


  void generalErrorMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('An error occurred, please try again later'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.redAccent,
      ),
    );
  }


  void wrongEmailMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Incorrect Email'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.redAccent,

      ),
    );
  }

  void wrongPasswordMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Incorrect Password'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.redAccent,

      ),
    );
  }


//////////////////////////// Sign in Exceptions & Validators - - End /////////////////////////////

//////////////////////////// sign user in method - Start /////////////////////////////




  void signUserIn() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

/*
if (!isValidEmail(emailController.text)) {
      wrongEmailMessage();
      return;
    }

    if (!isValidPassword(passwordController.text)) {
      wrongPasswordMessage();
      return;
    }
  */


    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),

      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      } else {
        generalErrorMessage();
      }
      Navigator.pop(context);
      return;
    } catch (e) {
      // Handle network-related or other general exceptions
      networkIssueMessage();
      Navigator.pop(context);
      return;
    }
    Navigator.pop(context);
  }


//////////////////////////// Sign in with Google - Start /////////////////////////////



//////////////////////////// Login Page UI - Start /////////////////////////////

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
                    
                    Column(
                      children: [
                        const SizedBox(height: 50),

                        // Load a Lottie file from your assets
                        Lottie.asset(
                          'lib/images/lottie_pc_logo.json',
                          height: 150,
                          width: 150,
                        ),

                        const SizedBox(height: 50),

                        const Icon(
                          Icons.lock,
                          size: 100,
                        ),

                        const SizedBox(height: 50),
                        // welcome back, you've been missed!

                        Text(
                          'Welcome back you\'ve been missed!',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 25),

                        // Email TextField
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [

                              MyTextField(
                                validator: (value) {
                                  if (!isValidEmail(value!)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                controller: _emailController,
                                hintText: 'Email: admin@gmail.com',
                                obscureText: false,
                              ),

                              const SizedBox(height: 10),

                              // Password Field
                              MyTextField(
                                controller: _passwordController,
                                hintText: 'Password: admin123',
                                obscureText: true,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return ForgotPasswordPage();
                                  },),);
                                },

                                child: const Text(
                                  'Forgot Password?' ,

                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 25),
                        // sign in button

                        RawKeyboardListener(
                          focusNode: _focusNode,
                          onKey: (RawKeyEvent event) {
                            if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
                              signUserIn();
                            }
                          },
                          child: MyButton(
                            text: "Sign in",
                            onTap: signUserIn,
                          ),
                        ),


                        const SizedBox(height: 50),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Or continue with',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 50),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SquareTile(
                              imagePath: 'lib/images/google.png',
                              onTap: () async {
                                try {
                                  await AuthService().signInWithGoogle();
                                  // Navigate to the next page, or show a success message as needed
                                } catch (eg) {
                                  // Handle any errors or exceptions
                                  print('Error signing in with Google: $eg');
                                }                         
                              },
                            ),

                            const SizedBox(width: 15),

                            // apple button
                            SquareTile(
                                imagePath: 'lib/images/apple.png',
                                onTap: () {}),

                            const SizedBox(width: 15),
                            // facebook button
                            SquareTile(
                                imagePath: 'lib/images/facebook.png',
                                onTap: () {}),
                          ],
                        ),

                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 15),
                            // Linkedin button
                            SquareTile(
                                imagePath: 'lib/images/linkedin.png',
                                onTap: () {}),

                            const SizedBox(width: 15),
                            // anonymous button

                            SquareTile(
                              imagePath: 'lib/images/anonymous.png',
                              onTap: signInAnonymously,
                            )
                          ],
                        ),

                        const SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not a member?',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: const Text(
                                'Register now',
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