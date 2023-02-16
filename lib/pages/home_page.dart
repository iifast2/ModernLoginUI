import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

// Sign user  out method

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
      ]),
      body: Center(
          child: Text(
        "Logged in As :  ${user.email!}",
        style: TextStyle(fontSize: 40),
      )),
// body: Center(child: Text("Logged in As :  ${user.email!}" )),
    );
  }
}
