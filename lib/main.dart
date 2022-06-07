import 'package:flutter/material.dart';

import 'app.dart';
import 'app/common/helper/smart_card_helper.dart';
import 'injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initInjector();
  await injector.get<SmartCardHelper>().getCardSerialNumber();
  runApp(const MyApp());
}
