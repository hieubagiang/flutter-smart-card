import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LogUtils {
  /// methodCount:2 , // number of method calls to be displayed
  /// errorMethodCount: 8, // number of method calls if stacktrace is provided
  /// lineLength: 120, // width of the output
  /// colors: true, // Colorful log messages
  /// printEmojis: true, // Print an emoji for each log message
  /// printTime: false, // Should each log print contain a timestamp
  final _logger = Logger(
    printer: PrettyPrinter(),
  );

  void debugNormal(String text) {
    if (kDebugMode) {
      print("==========================================================");
      print("Logs Debug: $text");
      print("==========================================================");
    }
  }

  void logV(String text) {
    if (kDebugMode) _logger.v(text);
  }

  void logD(String text) {
    if (kDebugMode) _logger.d(text);
  }

  void logI(String text) {
    if (kDebugMode) _logger.i(text);
  }

  void logW(String text) {
    if (kDebugMode) _logger.w(text);
  }

  void logE(String text) {
    if (kDebugMode) _logger.e(text);
  }

  void logWtf(String text) {
    if (kDebugMode) _logger.wtf(text);
  }
}
