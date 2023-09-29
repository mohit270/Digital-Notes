import 'package:digital_note/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}



//copy
// actions: [
//   Builder(builder: (context) {
//     return IconButton(
//         onPressed: () async {
//           await FlutterClipboard.copy(_text);
//           ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text(' Copied to Clipboard')));
//         },
//         icon: const Icon(Icons.content_copy));
//   }),
// ],

//below app
// floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
// floatingActionButton: AvatarGlow(
//     endRadius: 75.0,
//     animate: _isListening,
//     glowColor: Theme.of(context).primaryColor,
//     duration: const Duration(milliseconds: 2000),
//     repeatPauseDuration: const Duration(milliseconds: 100),
//     repeat: true,
//     child: FloatingActionButton(
//         onPressed: _listen,
//         child: Icon(_isListening ? Icons.mic : Icons.mic_none))),

// below scaffold
// void _listen() async {
//   if (!_isListening) {
//     bool available = await _speech.initialize(
//       onStatus: (val) => print('onStatus: $val'),
//       onError: (val) {
//         print('onError: $val');
//       },
//     );
//     if (available) {
//       setState(() => _isListening = true);
//       _speech.listen(
//           onResult: (val) => setState(() {
//                 _text = val.recognizedWords;
//                 if (val.hasConfidenceRating && val.confidence > 0) {
//                   _confidence = val.confidence;
//                 }
//               }));int.parse(widget.user['color-id']);
//     }
//   } else {
//     setState(() => _isListening = false);
//     _speech.stop();
//   } 