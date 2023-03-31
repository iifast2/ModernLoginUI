import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/login_or_register_page.dart';
import 'package:modernlogintute/pages/login_page.dart';
import 'package:modernlogintute/pages/Mobile_screenshot_blocker.dart';
import 'package:modernlogintute/components/utils.dart';

import '../components/square_tile.dart';
import '../user_crud/add_user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
    Utils.enableScreenshotProtection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


/*        leading: IconButton(
          icon: const Icon(Icons.account_circle_rounded, color: Colors.white),
          onPressed: () {
            User? user = FirebaseAuth.instance.currentUser;
            if (user != null) {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfilePage(context),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please Log in!'),
                  duration: Duration(seconds: 4),
                  backgroundColor: Colors.purpleAccent,
                ),
              );
            }
          },
        ),
        */


        title: Center(
          child: Text(
            user.email!,
            style: const TextStyle(fontSize: 16),
          ),
        ),
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
          children: [

            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  // Use the user's profile picture URL as the image source
                  image: NetworkImage(user.photoURL ?? 'https://i.imgur.com/a73xXCl.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              "Logged in As: ${user.email}",
              style: const TextStyle(fontSize: 20),
            ),


            const SizedBox(height: 30),


            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MobileScreenshotBlockerPage(
                      onSecureModeChanged: () {},
                    ),
                  ),
                );
              },
              child: const Text('Go to Mobile Screenshot Blocker Page'),
            ),



            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddUserPage(),
                  ),
                );
              },
              child: const Text('Add user page'),
            ),

            const SizedBox(height: 15),

          ],
        ),
      ),
    );
  }
}


class MobileScreenshotBlockerPage extends StatelessWidget {
  final VoidCallback onSecureModeChanged;

  MobileScreenshotBlockerPage({required this.onSecureModeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Screenshot Blocker'),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Center(
        child: MobileScreenshotBlocker(onSecureModeChanged: onSecureModeChanged),
      ),
    );
  }
}
