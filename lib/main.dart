import 'dart:ui';

import 'package:crafty_bay/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('Initializing Firebase...');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('Firebase initialized successfully');

  //Framework Error
  FlutterError.onError = (errorDetails) {
    print('Flutter Error: $errorDetails');
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  //Framework async Error
  PlatformDispatcher.instance.onError = (error, stack) {
    print('Async Error: $error');
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  print('Running CraftyBay app...');
  runApp(CraftyBay());
}
