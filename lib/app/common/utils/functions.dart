import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'utils.dart';

class FunctionUtils {
  /// Common Function
  ///
  /// Log
  static void logWhenDebug(dynamic object, String message) {
    if (kDebugMode) {
      if (object is String) {
        log("$object => $message", name: StringUtils.appName);
      } else {
        log("${object.runtimeType} => $message", name: StringUtils.appName);
      }
    }
  }

  ///Convert String to Date
  static String stringToDateFormat({dynamic value, String? format, String? locale}) {
    if (value == null || value.toString().isEmpty) return "";
    String dateString;
    if (locale != null) {
      dateString = DateFormat(format, locale).format(DateTime.parse(value.toString())).toString();
    } else {
      dateString = DateFormat(format).format(DateTime.parse(value.toString())).toString();
    }
    return dateString;
  }

  //Convert Date to String
  static String? dateToDateFormat({DateTime? value, String? format}) {
    if (value == null || format == null) return null;
    String dateString = DateFormat(format).format(value).toString();
    return dateString;
  }

  static Future<bool> checkNetWork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      // return true;
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  static String convertFullNameToAvatarText(String? name) {
    final convertName = name?.trim().split(' ').map((e) => e.isNotEmpty ? e.substring(0, 1) : '').toList() ?? [];
    if (convertName.length > 2) {
      return '${convertName.first}${convertName.last}'.toUpperCase();
    } else {
      return convertName.join('').toUpperCase();
    }
  }

  static Future<void> showToast(String message, {Color? backgroundColor, Color? textColor}) async {
    await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor ?? ColorUtils.secondaryColor,
        textColor: textColor ?? ColorUtils.whiteColor,
        fontSize: FontSizeUtils.toastFontSize);
  }

  static void showSnackBar(String title, String message, {Color? backgroundColor, Color? colorText}) {
    Get.snackbar(title, message,
        backgroundColor: backgroundColor ?? ColorUtils.whiteColor,
        colorText: colorText ?? ColorUtils.blackColor,
        boxShadows: [
          BoxShadow(
            color: ColorUtils.primaryColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ]);
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  static Future<dynamic> showDialogCustom(
      {required BuildContext context, Function(dynamic)? afterClose, required Widget dialog}) async {
    final result = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => dialog,
    );
    return result;
  }

  static Timer startTimer({required Duration duration, Function? onTimeOut}) {
    int counter = duration.inSeconds;
    const oneSec = Duration(seconds: 1);
    Timer timer = Timer.periodic(oneSec, (timer) {
      if (counter == 0) {
        timer.cancel();
        onTimeOut?.call();
      } else {
        counter--;
      }
    });
    return timer;
  }

  static StreamTransformer transformer<T>(T Function(Map<String, dynamic> json) fromJson) =>
      StreamTransformer<dynamic, List<T>>.fromHandlers(
        handleData: (dynamic data, EventSink<List<T>> sink) {
          final snaps = data.docs.map((doc) => doc.data()).toList();
          final model = snaps.map((json) => fromJson(json as Map<String, dynamic>)).toList();
          sink.add(model);
        },
      );

  static String getGroupChatId(idUser, idPeer) {
    String groupChatId = '';
    if (idUser.hashCode <= idPeer.hashCode) {
      groupChatId = '$idUser-$idPeer';
    } else {
      groupChatId = '$idPeer-$idUser';
    }
    return groupChatId;
  }

  List<int> pinStringToNumber(List<int> stringCodeUnits) {
    List<int> data = [...stringCodeUnits];
    for (int i = 0; i < data.length; i++) {
      data[i] = data[i] - 48;
    }
    return data;
  }

  static Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? _pickedDate = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: ColorUtils.primaryColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: ColorUtils.primaryColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        initialDate: DateTime(DateTime.now().year - 22, DateTime.now().month),
        firstDate: DateTime(DateTime.now().year - 60, DateTime.now().month),
        lastDate: DateTime(DateTime.now().year - 18, DateTime.now().month));
    // FocusScope.of(context).requestFocus(FocusNode());

    return _pickedDate;
  }

  BigInt decodeBigInt(List<int> bytes) {
    BigInt result = BigInt.from(0);
    for (int i = 0; i < bytes.length; i++) {
      result += BigInt.from(bytes[bytes.length - i - 1]) << (8 * i);
    }
    return result;
  }

  final _byteMask = BigInt.from(0xff);

  /// Encode a BigInt into bytes using big-endian encoding.
  Uint8List encodeBigInt(BigInt number) {
    // Not handling negative numbers. Decide how you want to do that.
    int size = (number.bitLength + 7) >> 3;
    var result = Uint8List(size);
    for (int i = 0; i < size; i++) {
      result[size - i - 1] = (number & _byteMask).toInt();
      number = number >> 8;
    }
    return result;
  }

  String randomString(int length) {
    var rand = math.Random();
    var codeUnits = List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });
    return String.fromCharCodes(codeUnits);
  }
}
