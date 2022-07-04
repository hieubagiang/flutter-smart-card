import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';

export 'file_extension.dart';
export 'num_extension.dart';
export 'string_extension.dart';

extension NumberExtension on int {
  String get toHexa => toRadixString(16);
}

extension DateTimeExtension on DateTime {
  String toDateTimeString() => "$year/$month/$day";
  String toDateTimeVi() => "$day/$month/$year";
}

extension ProgressDialogFutureExt<T> on Future<T> {
  Future<T> withProgressDialog() {
    SmartDialog.showLoading();
    return whenComplete(() => SmartDialog.dismiss());
  }
}

extension FormatCurrencyExtension on int {
  String get formatCurrency =>
      NumberFormat.simpleCurrency(locale: 'vi', name: 'VNĐ', decimalDigits: 0)
          .format(this);
}
