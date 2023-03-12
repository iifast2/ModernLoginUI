import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/login_or_register_page.dart';
import 'package:modernlogintute/pages/login_page.dart';

class HomePage extends StatelessWidget {
<<<<<<< Updated upstream
  HomePage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

// Sign user  out method

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }
=======
  const HomePage({Key? key}) : super(key: key);
>>>>>>> Stashed changes


  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
      ]),
      body: Center(
          child: Text(
        "Logged in As :  ${user.email!}",
        style: const TextStyle(fontSize: 40),
      )),
// body: Center(child: Text("Logged in As :  ${user.email!}" )),
    );
=======
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final user = snapshot.data;

        if (user == null) {
          // User is not authenticated, navigate to the anonymous view
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "You are not logged in",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the sign-up page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginOrRegisterPage()),
                      );
                    },
                    child: const Text("Sign up"),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Sign in anonymously
                      FirebaseAuth.instance.signInAnonymously();
                    },
                    child: const Text("Sign in anonymously"),
                  ),
                ],
              ),





            ),
          );
        } else if (user.isAnonymous) {
          // User is authenticated anonymously
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(onPressed: _signUserOut, icon: const Icon(Icons.logout))
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(height: 50),
                  Icon(
                    Icons.home,
                    size: 100,
                  ),
                  SizedBox(height: 50),
                  Text(
                    "Logged in as anonymous",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 60,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (!user.emailVerified) {
          // User is authenticated but email is not verified
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Please verify your email address",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await user.sendEmailVerification();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Verification email sent")),
                      );
                    },
                    child: const Text("Send verification email"),
                  ),
                ],
              ),
            ),
          );
        } else {
          // User is authenticated and email is verified
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(onPressed: _signUserOut, icon: const Icon(Icons.logout))
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Icon(
                    Icons.home,
                    size: 100,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "Logged in As :  ${user.email!}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 60,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  // Sign user out method
  Future<void> _signUserOut() async {
    await FirebaseAuth.instance.signOut();
>>>>>>> Stashed changes
  }
}
