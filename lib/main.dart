import 'package:flutter/material.dart';
import 'package:flutter_videos_app/core/services/services.dart';

import 'core/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.init();

  runApp(const MyApp());
}
