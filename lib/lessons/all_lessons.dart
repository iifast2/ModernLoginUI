import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'lesson_details.dart';


class MyLessonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lessons'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('htmleditor').snapshots(),

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;

              final lessonTitle = data['lesson_title'] ?? '';

              final createdAt = data['created_at'] != null
                  ? DateFormat('dd MMMM yyyy').format(data['created_at'].toDate())
                  : '';

              final lessonReference = data['lesson_reference'].toString() ?? '' ;

              return ListTile(
                title: Text(lessonTitle),
                subtitle: Text(createdAt),
                trailing: Text(lessonReference),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LessonDetailPage(data: data, docId: document.id)), //, docId: document.id
                  );
                },
              );

            }).toList(),
          );


        },
      ),
    );
  }
}
