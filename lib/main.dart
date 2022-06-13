import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); //Init Storage
  await initInjector();
  runApp(const MyApp());
}
