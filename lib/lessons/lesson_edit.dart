import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LessonEditPage extends StatefulWidget {
  final String docId;  // <-- Add this parameter
  final Map<String, dynamic> data;
  LessonEditPage({ required this.docId , required this.data});

  @override
  _LessonEditPageState createState() => _LessonEditPageState();

}

class _LessonEditPageState extends State<LessonEditPage> {
  late TextEditingController _htmlController;

  @override
  void initState() {
    super.initState();
    _htmlController = TextEditingController(text: widget.data['html']);
  }

  @override
  void dispose() {
    _htmlController.dispose();
    super.dispose();
  }

  Future<void> _saveHtml() async {
    await FirebaseFirestore.instance
        .collection('htmleditor')
        .doc(widget.docId) // use the docId passed in from the previous screen
        .update({'html': _htmlController.text});
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: const Text('Edit Lesson'),
        actions: [

          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveHtml,
          ),

        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(widget.data['lesson_reference']),

              const SizedBox(height: 16.0),

              TextField(
                controller: _htmlController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'HTML Content',
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
