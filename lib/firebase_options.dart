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
    apiKey: 'AIzaSyCQ5CLyhC8ejN9qvcSaUySG1zPyzjZTzvQ',
    appId: '1:109294602019:web:d62ee398a451698b33ae96',
    messagingSenderId: '109294602019',
    projectId: 'davidnoteproject',
    authDomain: 'davidnoteproject.firebaseapp.com',
    storageBucket: 'davidnoteproject.appspot.com',
    measurementId: 'G-NSGSGH5PQ4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAoC2GC129bGTAAEqwrN1VZ8YmcC2Fdgmw',
    appId: '1:109294602019:android:152ca039b58425ea33ae96',
    messagingSenderId: '109294602019',
    projectId: 'davidnoteproject',
    storageBucket: 'davidnoteproject.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGEg6B1imWQEVnIjMLMi874aLduXaVb5E',
    appId: '1:109294602019:ios:1b38468cd5910a9033ae96',
    messagingSenderId: '109294602019',
    projectId: 'davidnoteproject',
    storageBucket: 'davidnoteproject.appspot.com',
    iosClientId: '109294602019-eep6soe8r4nuk58bod9j6pbpjgdagcq9.apps.googleusercontent.com',
    iosBundleId: 'com.davesapp.mynotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDGEg6B1imWQEVnIjMLMi874aLduXaVb5E',
    appId: '1:109294602019:ios:1b38468cd5910a9033ae96',
    messagingSenderId: '109294602019',
    projectId: 'davidnoteproject',
    storageBucket: 'davidnoteproject.appspot.com',
    iosClientId: '109294602019-eep6soe8r4nuk58bod9j6pbpjgdagcq9.apps.googleusercontent.com',
    iosBundleId: 'com.davesapp.mynotes',
  );
}
