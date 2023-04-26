import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {

// I will call this widget when I got a docID and from that I will get a firstname

  final String documentId;

  GetUserName({required this.documentId});



  @override
  Widget build(BuildContext context) {


// Get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');


    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: ((context, snapshot) {

        // if the connection state is done = fully loaded , we grab the data from the snapshot
        if (snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;

          return Text('First Name: ${data['firstName']}' );

        }
        return const Text('Loading...');
      }),
    );
  }
}



