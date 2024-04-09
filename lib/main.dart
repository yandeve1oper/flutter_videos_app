import 'package:flutter/material.dart';

import 'package:flutter_videos_app/core/services/firebase_service.dart';
import 'package:flutter_videos_app/core/services/injector.dart';

import 'core/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.init();
  initDependencies();

  runApp(const MyApp());
}
