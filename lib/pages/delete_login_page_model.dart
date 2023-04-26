/* import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modernlogintute/services/auth_service.dart';

class LoginPageModel extends ChangeNotifier {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FocusNode _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void signInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message ?? 'An unknown error occurred.';
      notifyListeners();
    }
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    return emailRegex.hasMatch(email);
  }

  void networkIssueMessage() {
    _errorMessage = 'Network issue, please check your internet connection';
    notifyListeners();
  }

  void generalErrorMessage() {
    _errorMessage = 'An error occurred, please try again later';
    notifyListeners();
  }

  void wrongEmailMessage() {
    _errorMessage = 'Incorrect Email';
    notifyListeners();
  }

  void wrongPasswordMessage() {
    _errorMessage = 'Incorrect Password';
    notifyListeners();
  }

  void showValidationMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void signUserIn(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

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
      networkIssueMessage();
      Navigator.pop(context);
      return;
    }

    Navigator.pop(context);
  }

  void signInWithGoogle(BuildContext context) async {
    try {
      await AuthService().signInWithGoogle();
    } catch (e) {
      _errorMessage = 'Error signing in with Google: $e';
      notifyListeners();
    }
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void initState(BuildContext context) {
    _errorMessage = null;
  }

  // getters and setters for email and password controllers
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  // getter for focus node
  FocusNode get focusNode => _focusNode;

  // getter for form key
  GlobalKey<FormState> get formKey => _formKey;


}



 */