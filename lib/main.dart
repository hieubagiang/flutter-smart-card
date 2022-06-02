import 'package:flutter/material.dart';
import 'package:flutter_pcsc/flutter_pcsc.dart';
import 'package:smart_card/app/common/helper/smart_card_helper.dart';
import 'package:smart_card/extension.dart';

import 'app.dart';
import 'injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initInjector();

  runApp(const MyApp());
}
