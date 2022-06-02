import 'package:flutter_pcsc/flutter_pcsc.dart';
import 'package:smart_card/app/common/utils/log_utils.dart';
import 'package:smart_card/injector.dart';

class SmartCardCommand {
  static List<int> selectCmd = [0x00, 0xA4, 0x04, 0x00];
  static List<int> appletID = [0x11, 0x22, 0x33, 0x44, 0x55, 0x00];

  static List<int> connect() => [...selectCmd, appletID.length, ...appletID];
}

class SmartCardHelper {
  CardStruct? card;

  Future<void> getCardSerialNumber() async {
    int ctx = await Pcsc.establishContext(PcscSCope.user);
    try {
      List<String> readers = await Pcsc.listReaders(ctx);

      if (readers.isEmpty) {
        injector.get<LogUtils>().logD('Could not detect any reader');
      } else {
        String reader = readers[0];
        injector.get<LogUtils>().logI('Using reader: $reader');

        card = await Pcsc.cardConnect(
            ctx, reader, PcscShare.shared, PcscProtocol.any);
        var response = await Pcsc.transmit(card!, SmartCardCommand.connect());
        var sw = response.sublist(response.length - 2);
        var sn = response.sublist(0, response.length - 2);

        if (sw[0] != 0x90 || sw[1] != 0x00) {
          injector
              .get<LogUtils>()
              .logE('Card returned an error: ${hexDump(sw)}');
        } else {
          injector
              .get<LogUtils>()
              .logI('Card Serial Number is: ${hexDump(sn)}');
          injector.get<LogUtils>().logI('Done');
        }
      }
    } catch (e) {
      injector.get<LogUtils>().logE('Card returned an error: $e');
    } finally {
      if (card != null) {
        try {
          await Pcsc.cardDisconnect(card!.hCard, PcscDisposition.resetCard);
        } on Exception catch (e) {
          injector.get<LogUtils>().logE(e.toString());
        }
      }
      try {
        await Pcsc.releaseContext(ctx);
      } on Exception catch (e) {
        injector.get<LogUtils>().logI(e.toString());
      }
    }
  }

  static String hexDump(List<int> csn) {
    return csn
        .map((i) => i.toRadixString(16).padLeft(2, '0').toUpperCase())
        .join(' ');
  }
}
