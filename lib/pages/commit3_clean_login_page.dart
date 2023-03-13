
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';
import 'package:lottie/lottie.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modernlogintute/services/auth_service.dart';
import 'package:modernlogintute/pages/anonymous_home_page.dart';
import 'package:modernlogintute/pages/home_page.dart';
/*

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final FirebaseAuth _auth = FirebaseAuth.instance;


  void signInAnonymously() async {
    // show a loading circle while the user logs in
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Sign in anonymously
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      // hide the loading circle
      Navigator.pop(context);

      // show error to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'An unknown error occurred.'),
        ),
      );
    }

    // hide the loading circle
    Navigator.pop(context);
  }



//////////////////////////// Wrong Email & Password Messages For sign user in method - Start /////////////////////////////

  void wrongEmailMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Incorrect Email'),
      ),
    );
  }

  void wrongPasswordMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Incorrect Password'),
      ),
    );
  }
//////////////////////////// Wrong Email & Password Messages For sign user in method - End /////////////////////////////



//////////////////////////// sign user in method - Start /////////////////////////////

  void signUserIn() async {
    // show a loading circle while the user logs in ~ because that will take a lil bit of time
    // https://stackoverflow.com/a/63993275/10216101
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
}
on FirebaseAuthException catch (e) {
  // show error to user
  if (e.code == 'user-not-found') {
  wrongEmailMessage();
  } else if (e.code == 'wrong-password') {
  wrongPasswordMessage();
  }
  }

//////////////////////////// sign user in method - End /////////////////////////////



//////////////////////////// Sign in with Google - Start /////////////////////////////


  Future<UserCredential?> _signInWithGoogle() async {
    // Trigger the Google sign-in flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();


    // Obtain the auth details from the Google sign-in
    final GoogleSignInAuthentication googleAuth = await googleUser!
        .authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );


    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


//////////////////////////// Sign in with Google - End /////////////////////////////


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
            // the rest of the content

            Column(
                children: [
                const SizedBox(height: 50),

            // Load a Lottie file from your assets
            Lottie.asset('lib/images/lottie_pc_logo.json'
              ,
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
            // email textfield


            MyTextField(
              controller: emailController,
              hintText: 'Email: admin@gmail.com',
              obscureText: false,
            ),


            const SizedBox(height: 10),
            // password textfield


            MyTextField(
              controller: passwordController,
              hintText: 'Password: admin123',
              obscureText: true,
            ),


            const SizedBox(height: 10),
            // forgot password?


            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 25.0),
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
              text: "Sign in",
              onTap: signUserIn,
            ),


            const SizedBox(height: 50),
            // or continue with


            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 25.0),
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


            // google + apple sign in buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // google button


                SquareTile(
                  imagePath: 'lib/images/google.png',
                  onTap: () => AuthService().signInWithGoogle(),
                ),

                const SizedBox(width: 15),

                // apple button
                SquareTile(imagePath: 'lib/images/apple.png',
                    onTap: () {}),

                const SizedBox(width: 15),
                // facebook button
                SquareTile(imagePath: 'lib/images/facebook.png',
                    onTap: () {}),


              ],
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(width: 15),
                // Linkedin button
                SquareTile(imagePath: 'lib/images/linkedin.png',
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

*/
/*
                          anonymous-sign-in button
                        MyButton(
                          text: "Anonymous Sign-in",
                          onTap: () async {
                            final userCredential = await FirebaseAuth.instance.signInAnonymously();

                          },
                        ),

*//*


            const SizedBox(height: 30),

            // not a member? register now
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
  }*/
