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
    apiKey: 'AIzaSyDgYlGa0aGGRC8uBfRbBjWMqtCq3l-Tve8',
    appId: '1:650357033960:web:6134055998b2c68d21325d',
    messagingSenderId: '650357033960',
    projectId: 'locative-ee630',
    authDomain: 'locative-ee630.firebaseapp.com',
    storageBucket: 'locative-ee630.appspot.com',
    measurementId: 'G-2XDZBQ4DLT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCidLqDAJq5EaEe1aMtbBVTy2wdEyKsDcM',
    appId: '1:650357033960:android:eba7babcb71a6e3821325d',
    messagingSenderId: '650357033960',
    projectId: 'locative-ee630',
    storageBucket: 'locative-ee630.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAId4_KUQR3mIwF7dFTgCAFmikx_Gy6p2g',
    appId: '1:650357033960:ios:54cc5b42bd1f5e0821325d',
    messagingSenderId: '650357033960',
    projectId: 'locative-ee630',
    storageBucket: 'locative-ee630.appspot.com',
    iosBundleId: 'com.example.budgetOdc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAId4_KUQR3mIwF7dFTgCAFmikx_Gy6p2g',
    appId: '1:650357033960:ios:54cc5b42bd1f5e0821325d',
    messagingSenderId: '650357033960',
    projectId: 'locative-ee630',
    storageBucket: 'locative-ee630.appspot.com',
    iosBundleId: 'com.example.budgetOdc',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDgYlGa0aGGRC8uBfRbBjWMqtCq3l-Tve8',
    appId: '1:650357033960:web:2a4f25d3aa941e8521325d',
    messagingSenderId: '650357033960',
    projectId: 'locative-ee630',
    authDomain: 'locative-ee630.firebaseapp.com',
    storageBucket: 'locative-ee630.appspot.com',
    measurementId: 'G-TLJT9L2H5K',
  );
}
