import 'package:json_annotation/json_annotation.dart';
import 'package:smart_card/app/common/utils/date_time.dart';

import '../gender_enum.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  @JsonKey(name: 'identificationId')
  final String? cardId;
  @JsonKey(name: 'taxId')
  final String? taxId;
  @JsonKey(name: 'avatarImage')
  final String? avatarImage;
  @JsonKey(name: 'fingerPrintImage')
  final String? fingerPrintImage;
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'address')
  final String? placeOfResidence;
  @JsonKey(name: 'placeOfOrigin')
  final String? placeOfOrigin;
  @JsonKey(name: 'sex', toJson: _genderToJson, fromJson: _genderFromJson)
  final GenderType? sex;
  @JsonKey(name: 'national')
  final String? national;
  @JsonKey(name: 'birthday')
  final DateTime? birthday;
  @JsonKey(name: 'expiredDate')
  final DateTime? expiredDate;
  @JsonKey(name: 'releaseDate')
  final DateTime? releaseDate;
  @JsonKey(name: 'personalIdentification')
  final String? personalIdentification;
  @JsonKey(
      name: 'amount',
      defaultValue: 0,
      toJson: _amountToJson,
      fromJson: _amountFromJson)
  final int amount;
  @JsonKey(
      name: 'debt',
      defaultValue: 0,
      toJson: _amountToJson,
      fromJson: _amountFromJson)
  final int debt;
  @JsonKey(name: 'autoPay', defaultValue: false)
  final bool autoPay;

  factory UserModel.fromRaw(String raw) {
    int i = 0;
    final properties = raw.split('\$');
    return UserModel(
      cardId: properties[i++],
      taxId: properties[i++],
      avatarImage: properties[i++],
      fingerPrintImage: properties[i++],
      fullName: properties[i++],
      placeOfResidence: properties[i++],
      placeOfOrigin: properties[i++],
      sex: properties[i++] == '0' ? GenderType.male : GenderType.female,
      national: properties[i++],
      birthday: DateTimeUtils.getDateTime(properties[i++],
          pattern: Pattern.ddMMyyyy_vi),
      expiredDate: DateTimeUtils.getDateTime(properties[i++],
          pattern: Pattern.ddMMyyyy_vi),
      releaseDate: DateTimeUtils.getDateTime(properties[i++],
          pattern: Pattern.ddMMyyyy_vi),
      personalIdentification: properties[i++],
      amount: int.parse(properties[i++]),
      debt: int.parse(properties[i++]),
      autoPay: properties[i++] == 'true',
    );
  }

//<editor-fold desc="Data Methods">

  UserModel({
    this.cardId,
    this.taxId,
    this.avatarImage,
    this.fingerPrintImage,
    this.fullName,
    this.placeOfResidence,
    this.placeOfOrigin,
    this.sex,
    this.national,
    this.birthday,
    this.expiredDate,
    this.releaseDate,
    this.personalIdentification,
    this.autoPay = false,
    this.amount = 0,
    this.debt = 0,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          cardId == other.cardId &&
          taxId == other.taxId &&
          avatarImage == other.avatarImage &&
          fingerPrintImage == other.fingerPrintImage &&
          fullName == other.fullName &&
          placeOfResidence == other.placeOfResidence &&
          placeOfOrigin == other.placeOfOrigin &&
          sex == other.sex &&
          national == other.national &&
          birthday == other.birthday &&
          expiredDate == other.expiredDate &&
          releaseDate == other.releaseDate &&
          personalIdentification == other.personalIdentification &&
          amount == other.amount &&
          autoPay == other.autoPay &&
          debt == other.debt);

  @override
  int get hashCode =>
      cardId.hashCode ^
      taxId.hashCode ^
      avatarImage.hashCode ^
      fingerPrintImage.hashCode ^
      fullName.hashCode ^
      placeOfResidence.hashCode ^
      placeOfOrigin.hashCode ^
      sex.hashCode ^
      national.hashCode ^
      birthday.hashCode ^
      expiredDate.hashCode ^
      releaseDate.hashCode ^
      personalIdentification.hashCode ^
      debt.hashCode ^
      autoPay.hashCode ^
      amount.hashCode;

  UserModel copyWith({
    String? cardId,
    String? taxId,
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
    int? debt,
    int? i,
    bool? autoPay,
  }) {
    return UserModel(
      cardId: cardId ?? this.cardId,
      autoPay: autoPay ?? this.autoPay,
      taxId: taxId ?? this.taxId,
      avatarImage: avatarImage ?? this.avatarImage,
      fingerPrintImage: fingerPrintImage ?? this.fingerPrintImage,
      fullName: fullName ?? this.fullName,
      placeOfResidence: placeOfResidence ?? this.placeOfResidence,
      placeOfOrigin: placeOfOrigin ?? this.placeOfOrigin,
      sex: sex ?? this.sex,
      national: nationality ?? this.national,
      birthday: birthday ?? this.birthday,
      expiredDate: expiredDate ?? this.expiredDate,
      releaseDate: releaseDate ?? this.releaseDate,
      personalIdentification:
          personalIdentification ?? this.personalIdentification,
      amount: amount ?? this.amount,
      debt: debt ?? this.debt,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  String simplify() =>
      (cardId ?? '') +
      "\$" +
      (taxId ?? '') +
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
      national! +
      "\$" +
      '${DateTimeUtils.getStringDate(birthday, pattern: Pattern.ddMMyyyy_vi)}' +
      "\$" +
      '${DateTimeUtils.getStringDate(expiredDate, pattern: Pattern.ddMMyyyy_vi)}' +
      "\$" +
      '${DateTimeUtils.getStringDate(releaseDate, pattern: Pattern.ddMMyyyy_vi)}' +
      "\$" +
      personalIdentification! +
      "\$" +
      '$amount' +
      "\$" +
      '$debt' +
      "\$" +
      '$autoPay';

//</editor-fold>

  static String _genderToJson(GenderType? type) => type?.id.toString() ?? '';

  static GenderType _genderFromJson(int id) {
    return id == GenderType.male.id ? GenderType.male : GenderType.female;
  }

  static String _amountToJson(int amount) => amount.toString();

  static int _amountFromJson(String amount) {
    return int.tryParse(amount) ?? 0;
  }
}
