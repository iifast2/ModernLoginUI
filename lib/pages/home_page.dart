import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/add_many_users_mobile.dart';
import 'package:modernlogintute/pages/add_many_users.dart';
import 'package:modernlogintute/pages/login_or_register_page.dart';
import 'package:modernlogintute/pages/login_page.dart';
import 'package:modernlogintute/pages/Mobile_screenshot_blocker.dart';
import 'package:modernlogintute/components/utils.dart';

import '../lessons/all_lessons.dart';
import '../new/users_management.dart';
import '../user_crud/add_user.dart';
import '../user_crud/read_users.dart';
import 'add_many_users.dart';
import 'add_users_json.dart';

class HomePage extends StatefulWidget {
  //final User user;
  final String userId;

//required this.user
  const HomePage({Key? key, required this.userId}) : super(key: key);


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
    getUserData();

/*
    //  ########## UNCOMMENT THIS TO ACTIVATE ( FOR ANDROID ONLY )  : MobileScreenshotBlockerPage  ##########
    Utils.enableScreenshotProtection();
*/


  }


  Future<void> getUserData() async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    setState(() {
      //User = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  image: NetworkImage(
                      user.photoURL ?? 'https://i.imgur.com/a73xXCl.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Email: ${user.email}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              "User Display Name : ${user.displayName}",
              style: const TextStyle(fontSize: 20),
            ),

            Text(
              "User ID : ${user.uid}",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReadUsersPage(),
                  ),
                );
              },
              child: const Text('View All users page'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrangeAccent,),
            ),


            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddUserPage(),
                  ),
                );
              },
              child: const Text('Add New User '),
            ),

/*
            const SizedBox(height: 20),


            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UsersManagementPage(),
                  ),
                );
              },
              child: const Text(' User Management (upd+del)'),
            ),
*/

            const SizedBox(height: 30),

            const  Text(
              "Import your users to DB using  csv/xcel or Json",
              style: const TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddManyUsersPage(),
                      ),
                    );
                  },
                  icon: Ink.image(
                    image: AssetImage("lib/images/img-csv.png"),
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),

                const SizedBox(width: 30),

                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddUsersFromJsonPage(),
                      ),
                    );
                  },
                  icon: Ink.image(
                    image: AssetImage("lib/images/img-json.png"),
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyLessonsPage(),
                  ),
                );
              },
              child: const Text(' My Lessons Page'),
            ),

            const SizedBox(height: 20),

/*
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddManyUsersPageWeb(),
                  ),
                );
              },
              child: const Text('Add Many Users Page (Web)'),
            ),
*/




/*
//  ########## UNCOMMENT THIS TO ACTIVATE ( FOR ANDROID ONLY )  : MobileScreenshotBlockerPage  ##########
      // if you activate it and use web browser to run your app some errors may show up becuz it's not android device !
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
  //  ########## UNCOMMENT THIS TO ACTIVATE ( FOR ANDROID ONLY )  : MobileScreenshotBlockerPage  ##########
    */

          ],
        ),
      ),
    );
  }
}



/*
//  ########## UNCOMMENT THIS TO ACTIVATE ( FOR ANDROID ONLY )  : MobileScreenshotBlockerPage  ##########
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
*/
