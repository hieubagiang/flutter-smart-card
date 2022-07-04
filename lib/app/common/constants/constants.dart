class ConstantsUtils {
  /// Common Constants
  static const String language = 'LANGUAGE';
  static const int clickDelay = 500;

  //API
  static const int pageSize = 10;

  //IMAGE
  static const int imageMaxWidth = 1600;
  static const int imageSmallMaxWidth = 400;
  static const int imageQuality = 80;

  //LOGIN
  static const String accessTokenKey = 'ACCESS_TOKEN_KEY';
  static const String loginIdKey = 'LOGIN_ID';
  static const String pubKey = 'PUB_KEY';

  static const String chatApiKey = '2yfe9sav467x';
}

class ApiConstant {
  static const int connectTimeout = 30000;
  static const int responseTimeout = 30000;
  static const String contentType = 'application/json; charset=utf-8';
  static const String authentication = 'Authorization';
  static String baseUrl = 'http://54.186.242.141:3002/api';
  static String baseImageUrl = 'http://54.186.242.141:3002/api/files/';
}

class KeyArgument {}
