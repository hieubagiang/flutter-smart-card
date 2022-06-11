import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/common/utils/utils.dart';
import 'app/routes/app_pages.dart';
import 'app/translations/app_translations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1536, 824),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (contex, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            getPages: AppPages.pages,
            translations: MyTranslations(),
            locale: MyTranslations.fallbackLocale,
            navigatorObservers: [FlutterSmartDialog.observer],
            fallbackLocale: MyTranslations.fallbackLocale,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            supportedLocales: MyTranslations.locales,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              // DefaultCupertinoLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate, // Here !
              DefaultWidgetsLocalizations.delegate,
            ],
            initialRoute: RouteList.connectCard,

            /*
              FirebaseAuth.instance.currentUser == null
                  ? RouteList.welcome
                  : RouteList.signUp*/
            builder: FlutterSmartDialog.init(builder: (context, child) {
              return child!;
            }),
          );
        });
  }
}
