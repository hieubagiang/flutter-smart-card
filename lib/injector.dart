import 'package:get_it/get_it.dart';
import 'package:smart_card/app/data/provider/api.dart';

import 'app/common/helper/smart_card_helper.dart';
import 'app/common/network/http/dio_config.dart';
import 'app/common/utils/log_utils.dart';

GetIt injector = GetIt.asNewInstance();

Future<void> initInjector() async {
  // Dio client
  //database
  injector.registerSingleton<SmartCardHelper>(SmartCardHelper());
  injector.registerSingleton<Api>(Api(dio));

  // Dependencies
  // injector.registerSingleton<HomeApi>(HomeApi(injector()));

  ///Repository
  // injector.registerSingleton<HomeRepository>(
  //   HomeRepositoryImpl(injector()),
  // );

  injector.registerSingleton<LogUtils>(LogUtils());
}
