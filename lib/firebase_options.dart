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
    apiKey: 'AIzaSyDotn5EDpAkKH4u6ltBwMvz-ytP7AqzPrA',
    appId: '1:846946449640:web:b3762a8cf3ce8d0713b15d',
    messagingSenderId: '846946449640',
    projectId: 'authtutorial-c1a70',
    authDomain: 'authtutorial-c1a70.firebaseapp.com',
    storageBucket: 'authtutorial-c1a70.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmR0vZN4WhL09sXlA7JcOsbwnugTTiBUo',
    appId: '1:846946449640:android:2d2d85fc7b6d881013b15d',
    messagingSenderId: '846946449640',
    projectId: 'authtutorial-c1a70',
    storageBucket: 'authtutorial-c1a70.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCb3oyMW-gyCj8IFvoIJF_j6o_xW5nGsVM',
    appId: '1:846946449640:ios:4d8446819047261913b15d',
    messagingSenderId: '846946449640',
    projectId: 'authtutorial-c1a70',
    storageBucket: 'authtutorial-c1a70.appspot.com',
    iosClientId: '846946449640-1af3r43hdi0u8r767l7p2o8up4henarr.apps.googleusercontent.com',
    iosBundleId: 'com.example.modernlogintute',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCb3oyMW-gyCj8IFvoIJF_j6o_xW5nGsVM',
    appId: '1:846946449640:ios:4d8446819047261913b15d',
    messagingSenderId: '846946449640',
    projectId: 'authtutorial-c1a70',
    storageBucket: 'authtutorial-c1a70.appspot.com',
    iosClientId: '846946449640-1af3r43hdi0u8r767l7p2o8up4henarr.apps.googleusercontent.com',
    iosBundleId: 'com.example.modernlogintute',
  );
}
