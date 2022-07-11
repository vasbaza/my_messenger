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
    apiKey: 'AIzaSyCLL044ZrSn4wvCyQREjFv13gs8Y6-0X8o',
    appId: '1:140104499521:web:1b0e965a47afb6c20be1c0',
    messagingSenderId: '140104499521',
    projectId: 'my-messanger-8bbf0',
    authDomain: 'my-messanger-8bbf0.firebaseapp.com',
    storageBucket: 'my-messanger-8bbf0.appspot.com',
    measurementId: 'G-LPBFMGY3H1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJXgWNlTdemmHSWjfTNJx-8Cp7NaiQNeo',
    appId: '1:140104499521:android:6b7868ec512d155a0be1c0',
    messagingSenderId: '140104499521',
    projectId: 'my-messanger-8bbf0',
    storageBucket: 'my-messanger-8bbf0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsnl4D8qzydIyMkPDefh7qi3xceBNQWDE',
    appId: '1:140104499521:ios:b79b9f15af7b9c810be1c0',
    messagingSenderId: '140104499521',
    projectId: 'my-messanger-8bbf0',
    storageBucket: 'my-messanger-8bbf0.appspot.com',
    iosClientId: '140104499521-0j8alfp81hqtc13sk9apggl39d998kvf.apps.googleusercontent.com',
    iosBundleId: 'com.example.myMessanger',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDsnl4D8qzydIyMkPDefh7qi3xceBNQWDE',
    appId: '1:140104499521:ios:b79b9f15af7b9c810be1c0',
    messagingSenderId: '140104499521',
    projectId: 'my-messanger-8bbf0',
    storageBucket: 'my-messanger-8bbf0.appspot.com',
    iosClientId: '140104499521-0j8alfp81hqtc13sk9apggl39d998kvf.apps.googleusercontent.com',
    iosBundleId: 'com.example.myMessanger',
  );
}
