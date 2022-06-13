import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../constants/constants.dart';

class StorageHelper {
  static GetStorage box = GetStorage();

/*
  static Future<void> setDataUser(LoginModel? model) async {
    if (model == null) {
      await clearUserLogin();
    } else {
      await box.write(
        ConstantsUtils.ACCESS_TOKEN_KEY,
        jsonEncode(model.toJson()),
      );
      FunctionUtils.logWhenDebug(StorageHelper, 'saved');
    }
  }

  static Future<LoginModel?> getDataUser() async {
    if (box.read(ConstantsUtils.ACCESS_TOKEN_KEY) != null) {
      String accessToken = await box.read(ConstantsUtils.ACCESS_TOKEN_KEY);
      return LoginModel.fromJson(jsonDecode(accessToken));
    }

    return null;
  }
*/

  static Future<void> clearUserLogin() async {
    await box.remove(ConstantsUtils.accessTokenKey);
  }

  static Future<String?> getLoginId() async {
    if (box.read(ConstantsUtils.loginIdKey) != null) {
      String data = await box.read(ConstantsUtils.loginIdKey);
      return jsonDecode(data);
    }
    return null;
  }

  static Future<String?> getPubKey() async {
    if (box.read(ConstantsUtils.pubKey) != null) {
      String data = await box.read(ConstantsUtils.pubKey);
      return jsonDecode(data);
    }
    return null;
  }

  static Future<void> setLoginId(String? loginId) async {
    await box.write(
      ConstantsUtils.loginIdKey,
      jsonEncode(loginId ?? ""),
    );
  }

  static Future<void> setPublicKey(String? loginId) async {
    await box.write(
      ConstantsUtils.pubKey,
      jsonEncode(loginId ?? ""),
    );
  }
}
