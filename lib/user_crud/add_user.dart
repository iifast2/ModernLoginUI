import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/my_textfield.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();


  Future<void> createUser({required String firstName, required String lastName, required String email, required int age}) async {
    // Reference to document
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    final json = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'age': age,
    };

    // Create document and write data to firebase
    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyTextField(
                  controller: _emailController,
                hintText: 'Email',
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              MyTextField(
                controller: _firstNameController,
                hintText: 'First Name',
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a first name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              MyTextField(
                controller: _lastNameController,
                hintText: 'Last Name',
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a last name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              MyTextField(
                controller: _ageController,
                hintText: 'Age',
                obscureText: false,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an age';
                  } else if (int.tryParse(value) == null) {
                    return 'Please enter a valid age';
                  }
                  return null;
                },
              ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Call the createUser function with the entered user data
                    createUser(
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      email: _emailController.text,
                      age: int.parse(_ageController.text),
                    );
                    // Navigate back to previous screen
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add User'),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}


class User {
  String uid;
  final String email;
  final String firstName;
  final String lastName;
  final int age;

  User({
    this.uid ='',
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.age,
  });

}
