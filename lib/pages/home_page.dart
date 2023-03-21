import 'package:cloud_firestore/cloud_firestore.dart';
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

  // document IDs
  List<String> docIDs = [];


  // go docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
            (snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            }));


  }


  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    getDocId();
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
              // "Logged in As: ${user.email ?? 'Unknown'}",
              "Logged in As: ${user.email}",
              style: const TextStyle(fontSize: 40),
            ),

        const SizedBox(height: 15),

        Expanded(

        child: FutureBuilder(
        future: getDocId(),
        builder: (context , snapshot){
          return ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text('name'),
                );
              });
        })
        ),
           


        const SizedBox(height: 15),


        // Button to Go to ScreenBlocker Page
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




// [ For Android ] / subpage - This will keep the screenshotBlocker on the home page always "on" !!
class MobileScreenshotBlockerPage extends StatelessWidget {
  final VoidCallback onSecureModeChanged;

  MobileScreenshotBlockerPage({required this.onSecureModeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
        AppBar(title: const Text('Mobile Screenshot Blocker'),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Center(
        child: MobileScreenshotBlocker(onSecureModeChanged: onSecureModeChanged),
      ),
    );
  }
}
