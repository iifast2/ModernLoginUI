import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/login_or_register_page.dart';
import 'package:modernlogintute/pages/login_page.dart';
import 'package:modernlogintute/pages/Mobile_screenshot_blocker.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Logged in As :  ${user.email!}",
              style: const TextStyle(fontSize: 40),
            ),
            MobileScreenshotBlocker(),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MobileScreenshotBlockerPage(),
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
  const MobileScreenshotBlockerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Screenshot Blocker')),
      body: Center(child: MobileScreenshotBlocker()),
    );
  }
}
