/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modernlogintute/core/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance;

  createUser(UserModel user){
    _db.collection("Users").add(user.toJson()).whenComplete(
            () => Get.SnackBar("Success", "Your account has been created.",

              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),


            ),



    );
  }

}


*/
