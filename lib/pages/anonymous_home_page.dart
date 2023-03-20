import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AnonymousHomePage extends StatelessWidget {
  const AnonymousHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

// I changed the App bar Now : Label + Icon (logout)
        void signUserOut() {
          FirebaseAuth.instance.signOut();
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple[200],
            elevation: 0,
            actions: [
              TextButton.icon(
                onPressed: signUserOut,
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),


          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(height: 50),
                Icon(
                  Icons.accessibility_new_rounded,
                  size: 100,
                  color: Colors.yellow,
                ),


                SizedBox(height: 50),

                Text(
                  "Logged in As Anonymous",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Sign user out method
  Future<void> _signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }
}