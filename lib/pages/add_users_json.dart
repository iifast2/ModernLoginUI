import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String firstName;
  final String lastName;
  final int age;

  User({required this.email, required this.firstName, required this.lastName, required this.age});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
    };
  }
}

class AddUsersFromJsonPage extends StatefulWidget {
  const AddUsersFromJsonPage({Key? key}) : super(key: key);

  @override
  _AddUsersFromJsonPageState createState() => _AddUsersFromJsonPageState();
}

class _AddUsersFromJsonPageState extends State<AddUsersFromJsonPage> {
  final _formKey = GlobalKey<FormState>();
  List<User> _users = [];

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result != null) {
      final file = result.files.first;
      final contents = utf8.decode(file.bytes!);
      final List<dynamic> jsonData = json.decode(contents);
      for (final data in jsonData) {
        final user = User(
          email: data['email'].toString().trim(),
          firstName: data['firstName'].toString().trim(),
          lastName: data['lastName'].toString().trim(),
          age: int.parse(data['age'].toString().trim()),
        );
        _users.add(user);
      }
      setState(() {});
    }
  }



  Future<void> createUser(User user) async {
    // Reference to document
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final json = user.toMap();
    // Create document and write data to firebase
    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Users From JSON'),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(height: 15),

                const Image(
                  image: AssetImage('lib/images/img-json.png'),
                  width: 60,
                  height: 60,
                ),

                const SizedBox(height: 15),

                const Text(
                  "Import your .json file here then click save ! ",
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: _pickFile,
                  child: const Text('Pick JSON File'),
                ),


                const SizedBox(height: 16.0),


                Expanded(
                  child: ListView.builder(
                    itemCount: _users.length,
                    itemBuilder: (context, index) {
                      final user = _users[index];
                      return ListTile(
                        title: Text(user.email),
                        subtitle: Text('${user.firstName} ${user.lastName}'),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    for (final user in _users) {
                      await createUser(user);
                      print('Adding user: ${user.email}');
                    }
                    Navigator.pop(context);
                  },
                  child: const Text('Add Users'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
