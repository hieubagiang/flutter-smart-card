// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      cardId: json['identificationId'] as String?,
      taxId: json['taxId'] as String?,
      avatarImage: json['avatarImage'] as String?,
      fingerPrintImage: json['fingerPrintImage'] as String?,
      fullName: json['fullName'] as String?,
      placeOfResidence: json['address'] as String?,
      placeOfOrigin: json['placeOfOrigin'] as String?,
      sex: UserModel._genderFromJson(json['sex'] as int),
      national: json['national'] as String?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      expiredDate: json['expiredDate'] == null
          ? null
          : DateTime.parse(json['expiredDate'] as String),
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
      personalIdentification: json['personalIdentification'] as String?,
      autoPay: json['autoPay'] as bool? ?? false,
      amount: json['amount'] == null
          ? 0
          : UserModel._amountFromJson(json['amount'] as String),
      debt: json['debt'] == null
          ? 0
          : UserModel._amountFromJson(json['debt'] as String),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'identificationId': instance.cardId,
      'taxId': instance.taxId,
      'avatarImage': instance.avatarImage,
      'fingerPrintImage': instance.fingerPrintImage,
      'fullName': instance.fullName,
      'address': instance.placeOfResidence,
      'placeOfOrigin': instance.placeOfOrigin,
      'sex': UserModel._genderToJson(instance.sex),
      'national': instance.national,
      'birthday': instance.birthday?.toIso8601String(),
      'expiredDate': instance.expiredDate?.toIso8601String(),
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'personalIdentification': instance.personalIdentification,
      'amount': UserModel._amountToJson(instance.amount),
      'debt': UserModel._amountToJson(instance.debt),
      'autoPay': instance.autoPay,
    };
