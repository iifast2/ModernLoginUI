import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/user_crud/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddManyUsersPage extends StatefulWidget {
  const AddManyUsersPage({Key? key}) : super(key: key);

  @override
  _AddManyUsersPageState createState() => _AddManyUsersPageState();
}

class _AddManyUsersPageState extends State<AddManyUsersPage> {
  final _formKey = GlobalKey<FormState>();
  List<User> _users = [];

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv', 'xlsx'],
    );

    if (result != null) {
      final file = result.files.first;
      final contents = utf8.decode(file.bytes!);
      final rows = contents.split('\n');
      for (int i = 1; i < rows.length; i++) {  // Start from the second row
        final row = rows[i];
        final cells = row.split(',');
        if (cells.length == 4) {
          final user = User(
            email: cells[0].trim(),
            firstName: cells[1].trim(),
            lastName: cells[2].trim(),
            // age: int.parse(cells[3].trim()),
          );
          _users.add(user);
        }
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
        title: const Text('Add/Import Many Users [csv or xcel]'),
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

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('lib/images/img-csv.png'),
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(height: 15),
                      Image(
                        image: AssetImage('lib/images/img-xls.png'),
                        width: 60,
                        height: 60,
                      ),
                    ],
                  ),
                ),




                const SizedBox(height: 15),

                const Text(
                  "Import your .csv or .xls file here then click save ! ",
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(height: 20),


                ElevatedButton(
                  onPressed: _pickFile,

                  child: const Text('Pick File'),
                ),
                const SizedBox(height: 16.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: _users.length,
                    itemBuilder: (context, index) {
                      final user = _users[index];
                      return ListTile(
                        title: Text(user.email),
                        subtitle: Text('${user.firstName} ${user.lastName} '),
                      );
                    },
                  ),
                ),

                ElevatedButton(
                  onPressed: () async {
                    for (final user in _users) {
                      await createUser(user);
                      print("Adding imported users");
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

