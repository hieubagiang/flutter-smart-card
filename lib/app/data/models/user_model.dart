import 'package:smart_card/app/common/utils/date_time.dart';

import '../gender_enum.dart';

class UserModel {
  final String cardId;
  final String pin;
  final String? avatarImage;
  final String? fingerPrintImage;
  final String fullName;
  final String address;
  final String original;
  final GenderType sex;
  final String national;
  final DateTime birthday;
  final DateTime expiredDate;
  final DateTime releaseDate;
  final String personalIdentification;
  final int amount;

  factory UserModel.fromRaw(String raw) {
    int i = 0;
    final properties = raw.split('\$');
    return UserModel(
      cardId: properties[i++],
      pin: properties[i++],
      // avatarImage: properties[i++],
      // fingerPrintImage: properties[i++],
      fullName: properties[i++],
      address: properties[i++],
      original: properties[i++],
      sex: properties[i++] == '1' ? GenderType.male : GenderType.female,
      national: properties[i++],
      birthday: DateTimeUtils.getDateTime(properties[i++],
          pattern: Pattern.ddMMyyyy_vi),
      expiredDate: DateTimeUtils.getDateTime(properties[i++],
          pattern: Pattern.ddMMyyyy_vi),
      releaseDate: DateTimeUtils.getDateTime(properties[i++],
          pattern: Pattern.ddMMyyyy_vi),
      personalIdentification: properties[i++],
      amount: int.parse(properties[i++]),
    );
  }

//<editor-fold desc="Data Methods">

  UserModel({
    required this.cardId,
    required this.pin,
    this.avatarImage,
    this.fingerPrintImage,
    required this.fullName,
    required this.address,
    required this.original,
    required this.sex,
    required this.national,
    required this.birthday,
    required this.expiredDate,
    required this.releaseDate,
    required this.personalIdentification,
    required this.amount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          cardId == other.cardId &&
          pin == other.pin &&
          avatarImage == other.avatarImage &&
          fingerPrintImage == other.fingerPrintImage &&
          fullName == other.fullName &&
          address == other.address &&
          original == other.original &&
          sex == other.sex &&
          national == other.national &&
          birthday == other.birthday &&
          expiredDate == other.expiredDate &&
          releaseDate == other.releaseDate &&
          personalIdentification == other.personalIdentification &&
          amount == other.amount);

  @override
  int get hashCode =>
      cardId.hashCode ^
      pin.hashCode ^
      avatarImage.hashCode ^
      fingerPrintImage.hashCode ^
      fullName.hashCode ^
      address.hashCode ^
      original.hashCode ^
      sex.hashCode ^
      national.hashCode ^
      birthday.hashCode ^
      expiredDate.hashCode ^
      releaseDate.hashCode ^
      personalIdentification.hashCode ^
      amount.hashCode;

  @override
  String toString() {
    return 'UserModel{'
        ' cardId: $cardId,'
        ' pin: $pin,'
        ' avatarImage: $avatarImage,'
        ' fingerPrintImage: $fingerPrintImage,'
        ' fullName: $fullName,'
        ' address: $address,'
        ' original: $original,'
        ' sex: $sex,'
        ' national: $national,'
        ' birthday: $birthday,'
        ' expiredDate: $expiredDate,'
        ' releaseDate: $releaseDate,'
        ' personalIdentification: $personalIdentification,'
        ' amount: $amount,'
        '}';
  }

  UserModel copyWith({
    String? cardId,
    String? pin,
    String? avatarImage,
    String? fingerPrintImage,
    String? fullName,
    String? address,
    String? original,
    GenderType? sex,
    String? national,
    DateTime? birthday,
    DateTime? expiredDate,
    DateTime? releaseDate,
    String? personalIdentification,
    int? amount,
    int? i,
  }) {
    return UserModel(
      cardId: cardId ?? this.cardId,
      pin: pin ?? this.pin,
      avatarImage: avatarImage ?? this.avatarImage,
      fingerPrintImage: fingerPrintImage ?? this.fingerPrintImage,
      fullName: fullName ?? this.fullName,
      address: address ?? this.address,
      original: original ?? this.original,
      sex: sex ?? this.sex,
      national: national ?? this.national,
      birthday: birthday ?? this.birthday,
      expiredDate: expiredDate ?? this.expiredDate,
      releaseDate: releaseDate ?? this.releaseDate,
      personalIdentification:
          personalIdentification ?? this.personalIdentification,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cardId': cardId,
      'pin': pin,
      'avatarImage': avatarImage,
      'fingerPrintImage': fingerPrintImage,
      'fullName': fullName,
      'address': address,
      'original': original,
      'sex': sex,
      'national': national,
      'birthday': birthday,
      'expiredDate': expiredDate,
      'releaseDate': releaseDate,
      'personalIdentification': personalIdentification,
      'amount': amount,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      cardId: map['cardId'] as String,
      pin: map['pin'] as String,
      avatarImage: map['avatarImage'] as String,
      fingerPrintImage: map['fingerPrintImage'] as String,
      fullName: map['fullName'] as String,
      address: map['address'] as String,
      original: map['original'] as String,
      sex: map['sex'] as GenderType,
      national: map['national'] as String,
      birthday: map['birthday'] as DateTime,
      expiredDate: map['expiredDate'] as DateTime,
      releaseDate: map['releaseDate'] as DateTime,
      personalIdentification: map['personalIdentification'] as String,
      amount: map['amount'] as int,
    );
  }

  String simplify() =>
      cardId +
      "\$" +
      pin + /*
      "\$" +
      (avatarImage ?? '') +
      "\$" +
      (fingerPrintImage ?? '') +*/
      "\$" +
      fullName +
      "\$" +
      address +
      "\$" +
      original +
      "\$" +
      '${sex.id}' +
      "\$" +
      national +
      "\$" +
      '${DateTimeUtils.getStringDate(birthday, pattern: Pattern.ddMMyyyy_vi)}' +
      "\$" +
      '${DateTimeUtils.getStringDate(expiredDate, pattern: Pattern.ddMMyyyy_vi)}' +
      "\$" +
      '${DateTimeUtils.getStringDate(releaseDate, pattern: Pattern.ddMMyyyy_vi)}' +
      "\$" +
      personalIdentification +
      "\$" +
      '$amount';
//</editor-fold>
}
