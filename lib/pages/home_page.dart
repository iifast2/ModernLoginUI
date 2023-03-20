import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/login_or_register_page.dart';
import 'package:modernlogintute/pages/login_page.dart';
import 'package:modernlogintute/pages/Mobile_screenshot_blocker.dart';
import 'package:modernlogintute/components/utils.dart';

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

/*            const Icon(
              Icons.home_rounded,
              size: 100,
              color: Colors.deepPurple,
            ),

            */


            Text(
              "Logged in As: ${user.email ?? 'Unknown'}",
              style: const TextStyle(fontSize: 40),
            ),

            const SizedBox(height: 24),


            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) => MobileScreenshotBlockerPage(
                      onSecureModeChanged: () {
                        // Secure mode has been changed
                      },
                    ),
                  ),
                );
              },


              child: const Text('Go to Mobile Screenshot Blocker Page'),



            ),
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
      appBar: AppBar(title: const Text('Mobile Screenshot Blocker')),
      body: Center(
        child: MobileScreenshotBlocker(onSecureModeChanged: onSecureModeChanged),
      ),
    );
  }
}
