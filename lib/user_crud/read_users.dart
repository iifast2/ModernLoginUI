import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modernlogintute/user_crud/user_model.dart';

class ReadUsersPage extends StatefulWidget {
  const ReadUsersPage({Key? key}) : super(key: key);

  @override
  _ReadUsersPageState createState() => _ReadUsersPageState();
}


class _ReadUsersPageState extends State<ReadUsersPage> {
  late Stream<List<User>> _usersStream;

  void deleteUser(String userId) {
    FirebaseFirestore.instance.collection('users').doc(userId).delete().then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User deleted successfully'),
        ),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete user: $error'),
          backgroundColor: Colors.red,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _usersStream = readUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _usersStream = readUsers();
              });

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Refreshing View All Users...'),
                ),
              );

              print('Refreshing View All Users !');
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: StreamBuilder<List<User>>(
        stream: _usersStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: constraints.maxWidth,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Name (first & last)')),
                          DataColumn(label: Text('Email')),
                          DataColumn(label: Text('Age')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: users.map(
                              (user) {
                            return DataRow(cells: [
                              DataCell(Text('${user.firstName} ${user.lastName}')),
                              DataCell(Text(user.email)),
                              DataCell(Text(user.age.toString())),
                              DataCell(
                                Row(
                                  children: [



                                    IconButton(
                                      onPressed: () {
                                        // Implement update functionality
                                        final docUser = FirebaseFirestore.instance
                                            .collection('users')
                                            .doc('my-id');

                                        // update specific field
                                          docUser.update({
                                            'firstName' : 'emma'

                                          });



                                      },
                                      icon: const Icon(Icons.edit, color: Colors.green),
                                    ),








                                    IconButton(
                                      onPressed: () {
                                        deleteUser(user.uid);
                                      },
                                      icon: const Icon(Icons.delete, color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ]);
                          },
                        ).toList(),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Stream<List<User>> readUsers() => FirebaseFirestore.instance
    .collection('users')
    .snapshots()
    .map((querySnapshot) =>
    querySnapshot.docs.map((doc) => User.fromMap(doc.data())).toList());
