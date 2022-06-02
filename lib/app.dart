import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/common/utils/utils.dart';
import 'app/routes/app_pages.dart';
import 'app/translations/app_translations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (contex, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            getPages: AppPages.pages,
            translations: MyTranslations(),
            locale: MyTranslations.locale,
            fallbackLocale: MyTranslations.fallbackLocale,
            theme: ThemeData(
              primarySwatch: Colors.pink,
            ),
            localizationsDelegates: const [],
            supportedLocales: MyTranslations.locales,
            initialRoute: RouteList.signIn,

            /*
              FirebaseAuth.instance.currentUser == null
                  ? RouteList.welcome
                  : RouteList.signUp*/
            builder: (context, child) {
              return child!;
            },
          );
        });
  }
}
