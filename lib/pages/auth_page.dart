import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/home_page.dart';
import 'package:modernlogintute/pages/login_page.dart';
import 'package:modernlogintute/pages/anonymous_home_page.dart';
import 'login_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

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
              // Check if email is verified
              if (user.emailVerified) {
                return HomePage();
              } else {
                // If email is not verified, show a message to the user
                return Scaffold(
                  appBar: AppBar(title: const Text("Email Verification")),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                // If the error is not an exception, you can handle it differently or ignore it
                              // If the error is not an exception, display a generic error message
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
                          child: const Text("Sign Out"),
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