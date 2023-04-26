import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/new/user_update_page.dart';

class UsersManagementPage extends StatefulWidget {
  UsersManagementPage({Key? key}) : super(key: key);
  @override
  _UsersManagementPageState createState() => _UsersManagementPageState();
}
class _UsersManagementPageState extends State<UsersManagementPage> {
  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> deleteUser(id) {
    return users
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  1: FixedColumnWidth(140),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  const TableRow(
                    children: [
                      TableCell(
                        child: Center(
                          child: Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(
                            'Role',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(
                            'Action',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for (var i = 0; i < storedocs.length; i++)
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text(
                              '${storedocs[i]['firstName']} ${storedocs[i]['lastName']}',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              storedocs[i]['email'],
                              style: const TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              storedocs[i]['role'],
                              style: const TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => {/*
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UserUpdatePage(
                                        id: storedocs[i]['id'],
                                      ),
                                    ),
                                  )*/
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.orange,
                                ),
                              ),

                              IconButton(
                                onPressed: () => {
                                  if(storedocs[i]['id'] != null) {
                                    deleteUser(storedocs[i]['id'])
                                  }
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),



                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );});
  }
}
