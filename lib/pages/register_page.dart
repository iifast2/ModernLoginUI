import 'package:cloud_firestore/cloud_firestore.dart';
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

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


// I used dispose() with these !!!


  @override
  void dispose(){
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose(); // Add this line
    _confirmPasswordController.dispose();
    _ageController.dispose();
    super.dispose();
  }


  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    if (!RegExp(r'(?=.*[\W_])').hasMatch(value)) {
      return 'Password must contain at least one special character (e.g., !@#\$%\^&\*)';
    }
    return null;
  }




  void signUserUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_passwordController.text.trim() != _confirmPasswordController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match.'),
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    try {
      // Create User
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      // add user Details
      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _emailController.text.trim(),
        int.parse(_ageController.text.trim()),
      );

      User? user = userCredential.user;
      await user?.sendEmailVerification(); // This sends the verification email
      print('Verification email sent to ${user?.email}');
    } on FirebaseAuthException catch (e) {
      signUserUpErrorMessages(e, context);
    } catch (e) {
      print(e);
    }
  } // Move the closing brace here




  Future addUserDetails(
      String firstName,String lastName,String email,int age) async {
    await FirebaseFirestore.instance.collection('users').add({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'age': age,
    });

  }



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
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.redAccent,
      ),
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

                        Form(
                          key: _formKey,
                          child: Column(
                            children: [

                              // email textfield
                              MyTextField(
                                validator: emailValidator,
                                controller: _emailController,
                                hintText: 'Email',
                                obscureText: false,
                              ),



                              const SizedBox(height: 10),


                              // first name textfield
                              MyTextField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                },
                                controller: _firstNameController,
                                hintText: 'First Name',
                                obscureText: false,
                              ),


                              const SizedBox(height: 10),

                              // last name textfield
                              MyTextField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your last name';
                                  }
                                  return null;
                                },
                                controller: _lastNameController,
                                hintText: 'Last Name',
                                obscureText: false,
                              ),


                              const SizedBox(height: 10),

                              // age textfield
                              MyTextField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your age';
                                  }
                                  if (int.tryParse(value) == null) {
                                    return 'Please enter a valid age';
                                  }
                                  int age = int.parse(value);
                                  if (age < 0 || age > 150) {
                                    return 'Please enter a valid age';
                                  }
                                  return null;
                                },
                                controller: _ageController,
                                hintText: 'Age',
                                obscureText: false,
                                keyboardType: TextInputType.number,
                              ),


                              const SizedBox(height: 10),

                              // password textfield
                              MyTextField(
                                validator: passwordValidator,
                                controller: _passwordController,
                                hintText: 'Password',
                                obscureText: true,
                              ),

                              const SizedBox(height: 10),

                              // confirm password textfield
                              MyTextField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your password';
                                  }
                                  if (value != _passwordController.text.trim()) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                                controller: _confirmPasswordController,
                                hintText: 'Confirm Password',
                                obscureText: true,
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
                        ),
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