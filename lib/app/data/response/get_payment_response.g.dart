// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetPaymentResponse _$$_GetPaymentResponseFromJson(
        Map<String, dynamic> json) =>
    _$_GetPaymentResponse(
      statusCode: json['statusCode'] as int?,
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PaymentHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetPaymentResponseToJson(
        _$_GetPaymentResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'status': instance.status,
      'data': instance.data,
    };

_$_PaymentHistory _$$_PaymentHistoryFromJson(Map<String, dynamic> json) =>
    _$_PaymentHistory(
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int?,
      identificationId: json['identificationId'] as String?,
      status: json['status'] as int?,
      message: json['message'] as String?,
      totalTax: json['totalTax'] as int?,
    );

Map<String, dynamic> _$$_PaymentHistoryToJson(_$_PaymentHistory instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'id': instance.id,
      'identificationId': instance.identificationId,
      'status': instance.status,
      'message': instance.message,
      'totalTax': instance.totalTax,
    };
