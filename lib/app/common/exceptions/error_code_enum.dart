import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ErrorCodeEnum {
  static ErrorCode? getErrorCode(String? code) {
    if (code == null || code.isEmpty) {
      return null;
    }
    ErrorCode? result;
    ErrorCode.values.map((value) {
      if (value.code == code) {
        result = value;
      }
    });
    return result;
  }
}

enum ErrorCode {
  userNotFound,
  userDisabled,
  weakPassword,
  emailAlreadyInUse,
  wrongPassword
}

extension ErrorCodeExtension on ErrorCode {
  String get code {
    switch (this) {
      case ErrorCode.userNotFound:
        return 'user-not-found';
      case ErrorCode.wrongPassword:
        return 'wrong-password';
      default:
        return 'someThingWhenWrong'.tr;
    }
  }

  String get message {
    switch (this) {
      case ErrorCode.userNotFound:
        return 'useNotFoundError'.tr;
      case ErrorCode.wrongPassword:
        return 'wrongPassword'.tr;
      default:
        return 'someThingWhenWrong'.tr;
    }
  }

  bool get showErrorMessage {
    switch (this) {
      case ErrorCode.userNotFound:
        return true;

      default:
        return true;
    }
  }
}
