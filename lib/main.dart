import 'package:flutter/material.dart';

import 'app.dart';
import 'injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initInjector();
  runApp(const MyApp());
}
