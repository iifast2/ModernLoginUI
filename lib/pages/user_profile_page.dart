import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {


  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(user?.email ?? 'User Email'),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const CircleAvatar(
              backgroundImage: AssetImage(
                  'lib/images/default_profile_image.png'),
              radius: 80,
            ),
            const SizedBox(height: 20),
            Text(
              user?.displayName ?? 'User Name',
              style: TextStyle(fontSize: 24),
            ),
            // Add more widgets to display other user data
          ],
        ),
      ),
    );
  }
}