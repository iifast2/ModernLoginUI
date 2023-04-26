/*
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';

class AddUsersCsvPage extends StatefulWidget {
  @override
  _AddUsersCsvPageState createState() => _AddUsersCsvPageState();
}

class _AddUsersCsvPageState extends State<AddUsersCsvPage> {
  List<List<dynamic>> _csvData = [];

  Future<void> _importCsv() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['csv']
      );
      if(result != null) {


        //File file = File(result.files.single.path!);
        File file = File.fromRawPath(result.files.single.bytes!);

        String csvString = await file.readAsString();
        List<List<dynamic>> csvTable = CsvToListConverter().convert(csvString);
        setState(() {
          _csvData = csvTable;
        });
      }
    } catch (e) {
      print(e);
    }
  }


  Future<void> _saveUsers() async {
    List<Map<String, dynamic>> users = [];

    for (int i = 1; i < _csvData.length; i++) {
      users.add({
       //  'uid': Uuid().v4(),
        'email': _csvData[i][0],
        'firstName': _csvData[i][1],
        'lastName': _csvData[i][2],
        'age': int.parse(_csvData[i][3]),
      });
    }

    try {
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
      await usersCollection.add({'users': users});
      print('Users added successfully');
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Users CSV'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              child: Text('Import CSV'),
              onPressed: _importCsv,
            ),
          ),
         const SizedBox(height: 20),

          const Text('CSV Data:', style: TextStyle(fontWeight: FontWeight.bold)),

          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _csvData.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    for (var field in _csvData[index]) ...[
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          field.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          ElevatedButton(
            child: Text('Save Users'),
            onPressed: _csvData.isEmpty ? null : _saveUsers,
          ),

        ],
      ),
    );
  }
}
*/
