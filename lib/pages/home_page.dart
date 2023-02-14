import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.home,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // Welcome to our HomePage !
                Text(
                  'Welcome to our HomePage !',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 30,
                  ),
                ),

                const SizedBox(height: 50),

                // You are Logged in ~ Text!
                const Text(
                  'You are Logged in !!!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60,
                  ),
                ),


                const SizedBox(height: 30),


              ],
            ),
          ),
        ),
      ),
    );




  }
}













