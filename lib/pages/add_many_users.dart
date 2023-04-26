/*
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';



class AddManyUsersPageWeb extends StatefulWidget {
  @override
  _AddManyUsersPageWebState createState() => _AddManyUsersPageWebState();
}

class _AddManyUsersPageWebState extends State<AddManyUsersPageWeb> {
  final _formKey = GlobalKey<FormState>();
  List<List<dynamic>> _csvData = [];
  bool _isLoading = false;

  Future<void> _importCSV() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    if (result == null || result.files.isEmpty) {
      return;
    }

    final path = result.files.single.path!;
    final file = File(path);
    final csvString = await file.readAsString();
    final csvData = CsvToListConverter().convert(csvString);
    setState(() {
      _csvData = csvData;
    });
  }

  Future<void> _addUsers() async {
    setState(() {
      _isLoading = true;
    });
    try {
      for (final row in _csvData) {
        final email = row[0].toString();
        final firstName = row[1].toString();
        final lastName = row[2].toString();
        final age = int.tryParse(row[3].toString());
        if (email.isEmpty || firstName.isEmpty || lastName.isEmpty || age == null) {
          continue;
        }
        // Here, you can add your code to create users in Firebase with the parsed data
        // For example, you can use the Firestore package:
        // await FirebaseFirestore.instance.collection('users').add({
        //   'email': email,
        //   'firstName': firstName,
        //   'lastName': lastName,
        //   'age': age,
        // });
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Users added successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to add users')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Many Users'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: _importCSV,
                icon: const Icon(Icons.file_upload),
                label: const Text('Import CSV File'),
              ),
              const SizedBox(height: 16),
              if (_csvData.isNotEmpty)
                DataTable(
                  columns: const [
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('First Name')),
                    DataColumn(label: Text('Last Name')),
                    DataColumn(label: Text('Age')),
                  ],
                  rows: _csvData.map<DataRow>((row) {
                    return DataRow(cells: [
                      DataCell(Text(row[0].toString())),
                      DataCell(Text(row[1].toString())),
                      DataCell(Text(row[2].toString())),
                      DataCell(Text(row[3].toString())),
                    ]);
                  }).toList(),
                ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isLoading ? null : _addUsers,
                child: _isLoading ? const CircularProgressIndicator() : const Text('Add Users'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> processCsvData(String csvData) async {
  final List<List<dynamic>> csvTable =
  const CsvToListConverter().convert(csvData);

  // Remove header row
  final List<List<dynamic>> userData = csvTable.sublist(1);

  for (final List<dynamic> row in userData) {
    final String name = row[0];
    final String email = row[1];
    final String password = row[2];

    try {
      // Create user account with email and password
      final UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Set display name for user
      await userCredential.user?.updateDisplayName(name);

      // Create user document in Firestore
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
        'name': name,
        'email': email,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // Email already exists, skip this row
        continue;
      } else {
        // Handle other errors
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }
}

*/
