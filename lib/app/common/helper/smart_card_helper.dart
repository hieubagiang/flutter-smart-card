import 'package:flutter_pcsc/flutter_pcsc.dart';
import 'package:smart_card/app/common/utils/log_utils.dart';
import 'package:smart_card/injector.dart';

import '../../data/models/apdu_command_model.dart';
import '../../data/models/apdu_response.dart';

class SmartCardConstant {
  static List<int> selectCmd = [0x00, 0xA4, 0x04, 0x00];
  static List<int> appletID = [0x11, 0x22, 0x33, 0x44, 0x55, 0x00];

  static List<int> connect() => [...selectCmd, appletID.length, ...appletID];
  static int walletCla = 0xB0;
  static int verify = 0x20;
  static int credit = 0x30;
  static int debit = 0x40;
  static int signUpCard = 0x50;
  static int unblock = 0x60;
  static int changePass = 0x70;
  static int insGetCardData = 0x13;
  static int success = 0x90;

  // maximum balance
  static int maxBalance = 0x7FFF;

  // maximum transaction amount
  static int maxTransactionAmount = 0xFF;

  // maximum number of incorrect tries before the
  // PIN is blocked
  static int pinTryLimit = 3;

  // maximum size PIN
  static int maxPinSize = 0x08;

  // signal that the PIN verification failed
  static int swVerificationFailed = 0x6312;

  // signal the PIN validation is required
  // for a credit or a debit transaction
  static int swPinVerificationRequired = 0x6311;

  // signal invalid transaction amount
  // amount > MAX_TRANSACTION_MAOUNT or amount < 0
  static int swInvalidTransactionAmount = 0x6A83;

  // signal that the balance exceed the maximum
  static int swExceedMaximumBalance = 0x6A84;

  // signal the balance becomes negative
  static int swNegativeBalance = 0x6A85;
}

class SmartCardHelper {
  CardStruct? card;
  int? ctx;
  List<int>? appletId;

  Future<bool> connectCard(List<int> appletId) async {
    this.appletId = appletId;
    bool isSuccess = false;
    ctx = await Pcsc.establishContext(PcscSCope.user);
    try {
      List<String> readers = await Pcsc.listReaders(ctx!);

      if (readers.isEmpty) {
        injector.get<LogUtils>().logD('Could not detect any reader');
      } else {
        String reader = readers[0];
        injector.get<LogUtils>().logI('Using reader: $reader');

        card = await Pcsc.cardConnect(
            ctx!, reader, PcscShare.shared, PcscProtocol.any);
        final ApduResponse? response =
            await sendApdu(ApduCommand.connect(appletID: appletId));
        if (response != null) {
          var sw = response.sw;

          if (sw[0] != 0x90 || sw[1] != 0x00) {
            injector
                .get<LogUtils>()
                .logE('Card returned an error: ${hexDump(sw)}');
          }
          injector.get<LogUtils>().logI('Connected');
          isSuccess = true;
        }
      }
    } catch (e) {
      injector.get<LogUtils>().logE('Card returned an error: $e');
    }
    return isSuccess;
  }

  Future<void> disconnect() async {
    if (card != null) {
      try {
        await Pcsc.cardDisconnect(card!.hCard, PcscDisposition.resetCard);
      } on Exception catch (e) {
        injector.get<LogUtils>().logE(e.toString());
      }
    }
    try {
      await Pcsc.releaseContext(ctx!);
    } on Exception catch (e) {
      injector.get<LogUtils>().logI(e.toString());
    }
  }

  static String hexDump(List<int> csn) {
    return csn
        .map((i) => i.toRadixString(16).padLeft(2, '0').toUpperCase())
        .join(' ');
  }

  Future<ApduResponse?> sendApdu(ApduCommand apduCommand) async {
    try {
      var response = await Pcsc.transmit(card!, apduCommand.toListInt());
      return ApduResponse.fromList(response);
    } catch (e) {
      injector.get<LogUtils>().logE(e.toString());
    }
    return null;
  }
}
