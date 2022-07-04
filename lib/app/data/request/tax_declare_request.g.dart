// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_declare_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaxDeclareRequest _$$_TaxDeclareRequestFromJson(Map<String, dynamic> json) =>
    _$_TaxDeclareRequest(
      personalIncome: json['personalIncome'] as int?,
      deduction: json['deduction'] as int?,
      insuranceDeduction: json['insuranceDeduction'] as int?,
      totalTax: json['totalTax'] as int?,
    );

Map<String, dynamic> _$$_TaxDeclareRequestToJson(
        _$_TaxDeclareRequest instance) =>
    <String, dynamic>{
      'personalIncome': instance.personalIncome,
      'deduction': instance.deduction,
      'insuranceDeduction': instance.insuranceDeduction,
      'totalTax': instance.totalTax,
    };
