// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAXdysdM442b7mrDcpr5Lnlh706jtO8EQI',
    appId: '1:807116280550:web:34f03886cecac90adc6127',
    messagingSenderId: '807116280550',
    projectId: 'signin-2fc50',
    authDomain: 'signin-2fc50.firebaseapp.com',
    storageBucket: 'signin-2fc50.appspot.com',
    measurementId: 'G-KBJYTEHM33',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnHIieuV_azLiNl2rskZr_ykErCxXZsWI',
    appId: '1:807116280550:android:5c3719c074b083f5dc6127',
    messagingSenderId: '807116280550',
    projectId: 'signin-2fc50',
    storageBucket: 'signin-2fc50.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLCNyQp03hmAi2UKcyP4QlJWTkTQcZLyU',
    appId: '1:807116280550:ios:2dbed435a639c2ecdc6127',
    messagingSenderId: '807116280550',
    projectId: 'signin-2fc50',
    storageBucket: 'signin-2fc50.appspot.com',
    iosBundleId: 'com.example.myApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDLCNyQp03hmAi2UKcyP4QlJWTkTQcZLyU',
    appId: '1:807116280550:ios:2dbed435a639c2ecdc6127',
    messagingSenderId: '807116280550',
    projectId: 'signin-2fc50',
    storageBucket: 'signin-2fc50.appspot.com',
    iosBundleId: 'com.example.myApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAXdysdM442b7mrDcpr5Lnlh706jtO8EQI',
    appId: '1:807116280550:web:4ec0ffa084a95359dc6127',
    messagingSenderId: '807116280550',
    projectId: 'signin-2fc50',
    authDomain: 'signin-2fc50.firebaseapp.com',
    storageBucket: 'signin-2fc50.appspot.com',
    measurementId: 'G-J8JMKPYYXK',
  );
}
