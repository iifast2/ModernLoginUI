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

//        final user = snapshot.data;

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
