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
    apiKey: 'AIzaSyB29D_6WSloJOhWwIFXXuhwq1jBCBkHFl8',
    appId: '1:451183390094:web:c42b94f652a61897c7c8df',
    messagingSenderId: '451183390094',
    projectId: 'firebaseswiper',
    authDomain: 'fir-swiper.firebaseapp.com',
    databaseURL: 'https://firebaseswiper-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'firebaseswiper.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpWswrv9a9TbWB0YfVSzc-lHsHB3u3PoA',
    appId: '1:451183390094:android:81e38e510ca46b65c7c8df',
    messagingSenderId: '451183390094',
    projectId: 'firebaseswiper',
    databaseURL: 'https://firebaseswiper-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'firebaseswiper.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBeo6r0Hsidhuc5U4waCnnE2OHTwuPAu_E',
    appId: '1:451183390094:ios:5ec6814a9c403ebdc7c8df',
    messagingSenderId: '451183390094',
    projectId: 'firebaseswiper',
    databaseURL: 'https://firebaseswiper-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'firebaseswiper.appspot.com',
    iosClientId: '451183390094-gnec5hqfe9idn4iin5r29da0ov1d29ls.apps.googleusercontent.com',
    iosBundleId: 'com.example.flashcardSpelling',
  );
}
