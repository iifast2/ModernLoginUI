import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileModel {
  final user = FirebaseAuth.instance.currentUser!;

  Future<DocumentSnapshot> getUserData() async {
    print("User UID: ${user.uid}");
    return await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
  }
}
