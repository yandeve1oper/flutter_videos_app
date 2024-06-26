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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDw4L_Ll9A3K19WHizhyfWLhHjKRlz2Vo',
    appId: '1:134907197573:android:03a4c5ff14bf9402a2d1ec',
    messagingSenderId: '134907197573',
    projectId: 'flutter-videos-app',
    storageBucket: 'flutter-videos-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0A3n4vwRugiSEvaR_6f1turmoOI-sitM',
    appId: '1:134907197573:ios:e4b8d484c10155b0a2d1ec',
    messagingSenderId: '134907197573',
    projectId: 'flutter-videos-app',
    storageBucket: 'flutter-videos-app.appspot.com',
    androidClientId: '134907197573-7fqpau38ev97kq8h7g9siakenmoh98ko.apps.googleusercontent.com',
    iosClientId: '134907197573-20hrb1ci8a8fasdl8tk5culm3j13lgpk.apps.googleusercontent.com',
    iosBundleId: 'com.ian.videosApp',
  );
}
