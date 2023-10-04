// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCfO_Y5YTaQVE2VlqAUQJpRsPXo0WWwvtQ',
    appId: '1:723912222938:web:8c97f06fffc0f5e4b71de3',
    messagingSenderId: '723912222938',
    projectId: 'fir-1293d',
    authDomain: 'fir-1293d.firebaseapp.com',
    storageBucket: 'fir-1293d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcpxpI8yMzKE9DIQKzy7xO8HJBqRW2rAA',
    appId: '1:723912222938:android:9b22d20cfa506c48b71de3',
    messagingSenderId: '723912222938',
    projectId: 'fir-1293d',
    storageBucket: 'fir-1293d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_lkNnpu0FRomVOPp50CDcVokxj-TX-sA',
    appId: '1:723912222938:ios:63d1cff63fced3cab71de3',
    messagingSenderId: '723912222938',
    projectId: 'fir-1293d',
    storageBucket: 'fir-1293d.appspot.com',
    iosBundleId: 'com.example.sign',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_lkNnpu0FRomVOPp50CDcVokxj-TX-sA',
    appId: '1:723912222938:ios:6ad156c15ddb83eab71de3',
    messagingSenderId: '723912222938',
    projectId: 'fir-1293d',
    storageBucket: 'fir-1293d.appspot.com',
    iosBundleId: 'com.example.sign.RunnerTests',
  );
}