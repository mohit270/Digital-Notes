import 'package:digital_note/create_note.dart';
import 'package:digital_note/note_card.dart';
import 'package:digital_note/update_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference Notes =
      FirebaseFirestore.instance.collection('Notes');
  Future<void> _delete(String productId) async {
    await Notes.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

  @override
  Widget build(BuildContext context) {
    final User? ur = FirebaseAuth.instance.currentUser;
    final CollectionReference Notes =
        FirebaseFirestore.instance.collection('Notes');
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.email),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                  child: Text(
                ur!.email.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 30),
              )),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: Notes.snapshots(),
                builder:
                    ((context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.connectionState ==
                      ConnectionState.active) {
                    if (streamSnapshot.hasData && streamSnapshot.data != null) {
                      return Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              final DocumentSnapshot user =
                                  streamSnapshot.data!.docs[index];
                              return noteCard(() {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return UpdateScreen(user: user);
                                  },
                                ));
                              }, () {
                                _delete(user.id);
                              }, user);
                            },
                            itemCount: streamSnapshot.data!.docs.length),
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
        backgroundColor: Colors.black,
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
