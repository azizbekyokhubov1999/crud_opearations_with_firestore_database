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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCvLrT-rrrXuWTjUtO8fMGi-nVGAdrnxQM',
    appId: '1:593298875843:web:11fc2829bd87dd060e4976',
    messagingSenderId: '593298875843',
    projectId: 'learnfirestoredatabace',
    authDomain: 'learnfirestoredatabace.firebaseapp.com',
    storageBucket: 'learnfirestoredatabace.appspot.com',
    measurementId: 'G-EJJCQ7J37H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBChP-i9Vi6UOXV-MyzAVXGClz2X_m4lCk',
    appId: '1:593298875843:android:aa3661f6743d33430e4976',
    messagingSenderId: '593298875843',
    projectId: 'learnfirestoredatabace',
    storageBucket: 'learnfirestoredatabace.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCz3WMjsneQ2tuvyk67975gOpFYOSpTs5A',
    appId: '1:593298875843:ios:93c41e203b7e2ec80e4976',
    messagingSenderId: '593298875843',
    projectId: 'learnfirestoredatabace',
    storageBucket: 'learnfirestoredatabace.appspot.com',
    iosBundleId: 'com.example.crudOpearationsWithFirestoreDatabase',
  );
}
