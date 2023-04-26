/*
import 'package:flutter/material.dart';

class UserUpdatePage extends StatefulWidget {
  final String email;
  String firstName;
  String lastName;
  int age;
  String role;

  UserUpdatePage({
    Key? key,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.role,
  }) : super(key: key);

  @override
  _UserUpdatePageState createState() => _UserUpdatePageState();
}

class UserUpdatePage extends StatefulWidget {
  final String id;

  UserUpdatePage({required this.id});

  @override
  _UserUpdatePageState createState() => _UserUpdatePageState();
}

class _UserUpdatePageState extends State<UserUpdatePage> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _lastName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update User'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                initialValue: _firstName,
                autofocus: false,
                onChanged: (value) => setState(() => _firstName = value),
                decoration: InputDecoration(
                  labelText: 'First Name: ',
                  labelStyle: TextStyle(fontSize: 20.0),
                  border: OutlineInputBorder(),
                  errorStyle:
                  TextStyle(color: Colors.redAccent, fontSize: 15),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter First Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                initialValue: _lastName,
                autofocus: false,
                onChanged: (value) => setState(() => _lastName = value),
                decoration: InputDecoration(
                  labelText: 'Last Name: ',
                  labelStyle: TextStyle(fontSize: 20.0),
                  border: OutlineInputBorder(),
                  errorStyle:
                  TextStyle(color: Colors.redAccent, fontSize: 15),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Last Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _updateUser,
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateUser() async {
    if (_formKey.currentState!.validate()) {
      // Perform update operation
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(widget.id)
            .update({
          'firstName': _firstName,
          'lastName': _lastName,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User updated successfully'),
          ),
        );
        Navigator.pop(context);
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update user'),
          ),
        );
      }
    }
  }
}
*/
