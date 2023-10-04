import 'dart:math';

import 'package:digital_note/app_style.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key, this.user});
  final DocumentSnapshot? user;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  DocumentSnapshot? get documentSnapshot => widget.user;
  int color_id = Random().nextInt(App_Style.cardsColor.length);
  TextEditingController note_content = TextEditingController();
  TextEditingController note_titile = TextEditingController();
  String creationdate = DateTime.now().toString();
  final CollectionReference Notes =
      FirebaseFirestore.instance.collection('Notes');

  @override
  void initState() {
    super.initState();
    note_content.text = documentSnapshot?['note_content'] ?? '';
    note_titile.text = documentSnapshot?['note_titile'] ?? '';
    creationdate = documentSnapshot?['creation_date'] ?? '';
    color_id = int.tryParse(documentSnapshot?['color_id']) ??
        0; // Provide a default value if needed
  }

  void updateUser() {
    // ignore: unnecessary_null_comparison
    if (note_content != null || note_titile != null) {
      Notes.doc(widget.user!.id).update({
        'note_titile': note_titile.text.trim(),
        'note_content': note_content.text.trim(),
        'color_id': "$color_id",
        'creation_date': DateTime.now().toString()
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Add Note'),
        actions: [
          TextButton(
              onPressed: () {
                updateUser();
              },
              child: const Icon(
                Icons.save_alt,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: note_titile,
              expands: false,
              style: App_Style.mainTitle,
              decoration: const InputDecoration(
                  hintText: 'Note Title', border: InputBorder.none),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              creationdate,
              style: App_Style.dateTitle,
            ),
            const SizedBox(
              height: 28,
            ),
            Expanded(
              child: TextField(
                controller: note_content,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: App_Style.mainContent,
                decoration: const InputDecoration(
                    hintText: 'Note content', border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () {
          updateUser();
        },
        label: const Text('Update Node'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
