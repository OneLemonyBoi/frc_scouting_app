// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
            'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSp_BohcVGoGJ7e4snNBd9aHK7UQuFoUg',
    appId: '1:81364918086:android:42fab0f8c8335dff534f47',
    messagingSenderId: '81364918086',
    projectId: 'sor6059scoutinga',
    storageBucket: 'sor6059scoutinga.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsgXv7uPtaO11nzUGz7JBygK6ozC6lStA',
    appId: '1:81364918086:ios:d18b6bb45b8435da534f47',
    messagingSenderId: '81364918086',
    projectId: 'sor6059scoutinga',
    storageBucket: 'sor6059scoutinga.appspot.com',
    iosClientId: '81364918086-eukjhkksr426h2v51egs75df18f4orko.apps.googleusercontent.com',
    iosBundleId: 'dev.onelemonyboi.frcScoutingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCsgXv7uPtaO11nzUGz7JBygK6ozC6lStA',
    appId: '1:81364918086:ios:d18b6bb45b8435da534f47',
    messagingSenderId: '81364918086',
    projectId: 'sor6059scoutinga',
    storageBucket: 'sor6059scoutinga.appspot.com',
    iosClientId: '81364918086-eukjhkksr426h2v51egs75df18f4orko.apps.googleusercontent.com',
    iosBundleId: 'dev.onelemonyboi.frcScoutingApp',
  );
}
