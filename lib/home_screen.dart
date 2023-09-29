import 'package:digital_note/create_note.dart';
import 'package:digital_note/note_card.dart';
import 'package:digital_note/note_reader_screen.dart';
import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade600,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('Notes').snapshots(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              Map<String, dynamic> user =
                                  snapshot.data!.docs[index].data()
                                      as Map<String, dynamic>;
                              return noteCard(() {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return NoteReaderScreen(user);
                                  },
                                ));
                              }, () {
                                FirebaseFirestore.instance
                                    .collection('Notes')
                                    .doc('$index')
                                    .delete();
                              }, user);
                            },
                            itemCount: snapshot.data!.docs.length),
                      );
                    } else {
                      return const Text("No Data!");
                    }
                  }
                  return const Center(child: CircularProgressIndicator());
                })),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueGrey.shade600,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const CreateNote();
            },
          ));
        },
        label: const Text('Add Node'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
