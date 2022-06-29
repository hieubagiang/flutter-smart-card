// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:smart_card/app/common/extension/extensions.dart';

List<String> splitStringByLength(String str, int length) {
  int index = 0;
  List<String> data = [];
  while (index < str.length) {
    data.add(str.substring(
        index, index + length < str.length ? index + length : str.length));
    index = index + length;
  }
  //check last = fixedLength;

  assert(data.last.length % 2 == 0);
  if (data.last.length < length) {
    data.last += '0' * (length - data.last.length);
  }
  return data;
}

String toHexWithLength(String str, int length) {
  return str.padLeft(length, '0');
}

void main() {
  test('test int to hex', () {
    final str = 644444.toHex().formatHexLength(6);
    print('bytes: $str');
    print('bytes: ${'${str.splitByLength(2).parseToListInt()}'}');
  });
}
