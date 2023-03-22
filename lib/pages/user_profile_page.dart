import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/read_data/get_user_name.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  List<String> docIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
            (snapshot) => snapshot.docs.forEach((document) {
          print(document.reference);
          docIDs.add(document.reference.id);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.email!,
          style: const TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Logged in As: ${user.email}",
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: docIDs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: GetUserName(documentId: docIDs[index]),
                          );
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
