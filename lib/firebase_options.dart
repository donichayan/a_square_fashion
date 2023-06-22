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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBRwN9aLSbvFc2AIwtGwJor7gE0vhrfFsQ',
    appId: '1:833267280888:web:06f611e975d86f01a7440d',
    messagingSenderId: '833267280888',
    projectId: 'fashion-prototype-668c6',
    authDomain: 'fashion-prototype-668c6.firebaseapp.com',
    storageBucket: 'fashion-prototype-668c6.appspot.com',
    measurementId: 'G-RJ11F6GQM5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5vWV3U90skTBw7abqAoNYs133VieGjzk',
    appId: '1:833267280888:android:1f907f90a1ba9166a7440d',
    messagingSenderId: '833267280888',
    projectId: 'fashion-prototype-668c6',
    storageBucket: 'fashion-prototype-668c6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkZduupSD3QsPJ2RnMPgPldhpisyS2cb8',
    appId: '1:833267280888:ios:95895b7c9f4f82caa7440d',
    messagingSenderId: '833267280888',
    projectId: 'fashion-prototype-668c6',
    storageBucket: 'fashion-prototype-668c6.appspot.com',
    iosClientId: '833267280888-ar39ljkg0piqs6bp4il9pnrqlkc9h37b.apps.googleusercontent.com',
    iosBundleId: 'com.example.vieFashionWeek',
  );
}