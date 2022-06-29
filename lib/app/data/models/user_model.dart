import 'package:smart_card/app/common/utils/date_time.dart';

import '../gender_enum.dart';

class UserModel {
  final String? cardId;
  final String? pin;
  final String? avatarImage;
  final String? fingerPrintImage;
  final String? fullName;
  final String? placeOfResidence;
  final String? placeOfOrigin;
  final GenderType? sex;
  final String? nationality;
  final DateTime? birthday;
  final DateTime? expiredDate;
  final DateTime? releaseDate;
  final String? personalIdentification;
  final int? amount;

  factory UserModel.fromRaw(String raw) {
    int i = 0;
    final properties = raw.split('\$');
    return UserModel(
      cardId: properties[i++],
      pin: properties[i++],
      // avatarImage: properties[i++],
      // fingerPrintImage: properties[i++],
      fullName: properties[i++],
      placeOfResidence: properties[i++],
      placeOfOrigin: properties[i++],
      sex: properties[i++] == '1' ? GenderType.male : GenderType.female,
      nationality: properties[i++],
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
    this.cardId,
    this.pin,
    this.avatarImage,
    this.fingerPrintImage,
    this.fullName,
    this.placeOfResidence,
    this.placeOfOrigin,
    this.sex,
    this.nationality,
    this.birthday,
    this.expiredDate,
    this.releaseDate,
    this.personalIdentification,
    this.amount,
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
          placeOfResidence == other.placeOfResidence &&
          placeOfOrigin == other.placeOfOrigin &&
          sex == other.sex &&
          nationality == other.nationality &&
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
      placeOfResidence.hashCode ^
      placeOfOrigin.hashCode ^
      sex.hashCode ^
      nationality.hashCode ^
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
        ' address: $placeOfResidence,'
        ' original: $placeOfOrigin,'
        ' sex: $sex,'
        ' national: $nationality,'
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
    String? placeOfResidence,
    String? placeOfOrigin,
    GenderType? sex,
    String? nationality,
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
      placeOfResidence: placeOfResidence ?? this.placeOfResidence,
      placeOfOrigin: placeOfOrigin ?? this.placeOfOrigin,
      sex: sex ?? this.sex,
      nationality: nationality ?? this.nationality,
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
      'address': placeOfResidence,
      'original': placeOfOrigin,
      'sex': sex,
      'national': nationality,
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
      placeOfResidence: map['address'] as String,
      placeOfOrigin: map['original'] as String,
      sex: map['sex'] as GenderType,
      nationality: map['national'] as String,
      birthday: map['birthday'] as DateTime,
      expiredDate: map['expiredDate'] as DateTime,
      releaseDate: map['releaseDate'] as DateTime,
      personalIdentification: map['personalIdentification'] as String,
      amount: map['amount'] as int,
    );
  }

  String simplify() =>
      cardId! +
      "\$" +
      pin! +
      "\$" +
      (avatarImage ?? '') +
      "\$" +
      (fingerPrintImage ?? '') +
      "\$" +
      fullName! +
      "\$" +
      placeOfResidence! +
      "\$" +
      placeOfOrigin! +
      "\$" +
      '${sex?.id}' +
      "\$" +
      nationality! +
      "\$" +
      '${DateTimeUtils.getStringDate(birthday, pattern: Pattern.ddMMyyyy_vi)}' +
      "\$" +
      '${DateTimeUtils.getStringDate(expiredDate, pattern: Pattern.ddMMyyyy_vi)}' +
      "\$" +
      '${DateTimeUtils.getStringDate(releaseDate, pattern: Pattern.ddMMyyyy_vi)}' +
      "\$" +
      personalIdentification! +
      "\$" +
      '$amount';
//</editor-fold>
}
