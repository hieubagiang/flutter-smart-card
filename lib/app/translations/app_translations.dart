import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/translations/en_US/en_us_translations.dart';
import '../../app/translations/vi_VN/vi_vn_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en': enUs,
    'vi': viVn,
  };
}

class MyTranslations extends Translations {
  //locale can get when open app (dependent local system or cache local user setting and set it in here)
  static final locale = _getLocaleFromLanguage();

  // fallbackLocale is locale default if locale setting not in the Local support
  static const fallbackLocale = Locale('vi', 'VN');

  //language code of Locale support
  static final langCodes = [
    'vi',
    'en',
  ];

  //Locale support
  static final locales = [
    const Locale('vi', 'VN'),
    const Locale('en', 'US'),
  ];

  //function change language if u don't care language setting system
  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    // const locale = const Locale('vi', 'VN');

    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => AppTranslation.translations;

  // get locale from code of language. When don't have locale return local defalut
  static Locale _getLocaleFromLanguage({String? langCode}) {
    var lang = langCode ?? Get.deviceLocale?.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) {
        return locales[i];
      }
    }
    return fallbackLocale;
  }
}
