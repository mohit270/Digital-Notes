import 'dart:math';

import 'package:digital_note/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  int color_id = Random().nextInt(App_Style.cardsColor.length);
  TextEditingController note_content = TextEditingController();
  TextEditingController note_titile = TextEditingController();
  String creationdate = DateTime.now().toString();

  void saveUser() {
    if (note_content != null || note_titile != null) {
      FirebaseFirestore.instance.collection('Notes').add({
        'note_titile': note_titile.text.trim(),
        'note_content': note_content.text.trim(),
        'color_id': "$color_id",
        'creation_date': creationdate.toString().trim()
      });
      Navigator.pop(context);
    } else {
      final snackBar = SnackBar(
        content: Center(
          child: Text(
            'Fill Note Title',
            style: App_Style.mainTitle,
          ),
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.blueGrey.shade600,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade600,
        title: const Text('Add Note'),
        actions: [
          TextButton(
              onPressed: () {
                saveUser();
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
    );
  }
}
