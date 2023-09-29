import 'package:digital_note/app_style.dart';
import 'package:flutter/material.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.user, {super.key});
  Map<String, dynamic> user;
  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(' Read the Note '),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade600,
        elevation: 0.0,
        // leading: Builder(builder: (BuildContext context) {
        //   return IconButton(
        //     icon: Icon(Icons.update),
        //     onPressed: () {},
        //   );d
        // }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.user['note_titile'],
            style: App_Style.mainTitle,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.user['creation_date'],
            style: App_Style.dateTitle,
          ),
          const SizedBox(
            height: 28,
          ),
          Expanded(
            child: Text(
              widget.user['note_content'],
              style: App_Style.mainContent,
              maxLines: null,
            ),
          ),
        ]),
      ),
    );
  }
}
