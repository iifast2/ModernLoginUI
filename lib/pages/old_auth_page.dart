
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/home_page.dart';
import 'package:modernlogintute/pages/anonymous_home_page.dart';
import 'package:modernlogintute/pages/login_or_register_page.dart';
import 'dart:async';

/*
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Timer? _emailVerificationTimer;

  @override
  void initState() {
    super.initState();
    _startEmailVerificationTimer();
  }




  void _startEmailVerificationTimer() {
    _emailVerificationTimer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      // Check if the current user is not null and not anonymous
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && !currentUser.isAnonymous) {
        // Refresh user data
        await currentUser.reload();
        // Check if the email is now verified
        if (currentUser.emailVerified) {
          // Stop the timer, as the email is verified
          _stopEmailVerificationTimer();
          // Update the UI
          setState(() {});
        }
      }
    });
  }

  void _stopEmailVerificationTimer() {
    if (_emailVerificationTimer != null) {
      _emailVerificationTimer!.cancel();
      _emailVerificationTimer = null;
    }
  }

  @override
  void dispose() {
    _stopEmailVerificationTimer();
    super.dispose();
  }



////// Verify Email Exception (errors) Handeling //////
  void showEmailVerificationErrorSnackBar(Exception e, BuildContext context) {
    String errorMessage = 'Error sending verification email. Please try again later.';

    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'User not found. Please check your email address.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email address. Please check your email address.';
          break;
      // Add other FirebaseAuthException cases if needed
        default:
          errorMessage = 'Error sending verification email: ${e.message}';
          break;
      }
    } else {
      // If the exception is not a FirebaseAuthException, display the exception message
      errorMessage = 'Error sending verification email: ${e.toString()}';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.redAccent,
      ),
    );
  }



  Future<String> inputData() async {
    final User user = await FirebaseAuth.instance.currentUser!;
    final String uid = user.uid.toString();
    return uid;
  }


  getCurrentUser() async {
    final User user = await FirebaseAuth.instance.currentUser!;
    final myuid = user.uid;

    // Similarly we can get email as well
    //final uemail = user.email;
    print(myuid);
    //print(uemail);
  }
//////////////


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged in
          if (snapshot.hasData) {
            final User? user = snapshot.data;

            if (user != null) {
              // If the user is anonymous, navigate to AnonymousHomePage
              if (user.isAnonymous) {
                return AnonymousHomePage();
              }
              // Check if email is verified
              if (user.emailVerified) {
                getCurrentUser;
                return HomePage(myuid);
              } else {


                // If email is not verified, show a message to the user
                return Scaffold(
                  appBar: AppBar(title: const Text("Email Verification")),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Provide you email and we will send you a link to rest your password."),
                        const Text("Please verify your email before proceeding."),
                        TextButton(
                          onPressed: () async {
                            try {
                              // Resend the verification email
                              await user.sendEmailVerification();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Verification email sent.'),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.greenAccent,
                                ),
                              );
                            } catch (e) {
                              print(e);
                              if (e is Exception) {
                                // Call the showEmailVerificationErrorSnackBar function

                                showEmailVerificationErrorSnackBar(e, context);
                              } else {
                                */
/* If the error is not an exception, you can handle it differently or ignore it
                                If the error is not an exception, display a generic error message *//*

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                     content: Text('An unknown error occurred. ${e.toString()}'),
                                      duration: const Duration(seconds: 3),
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  );
                                }

                            }
                          },
                          child: const Text("Resend Verification Email"),
                        ),

                        TextButton(
                          onPressed: () async {
                            // Sign out the user
                            await FirebaseAuth.instance.signOut();
                          },
                          child: const Text("Go Back"),
                        ),
                      ],
                    ),
                  ),
                );
              }
            } else {
              // If the user is anonymous
              return AnonymousHomePage();
            }


          } else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
*/
