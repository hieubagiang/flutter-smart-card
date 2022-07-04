// To parse this JSON data, do
//
//     final getPaymentResponse = getPaymentResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_payment_response.freezed.dart';
part 'get_payment_response.g.dart';

@freezed
class GetPaymentResponse with _$GetPaymentResponse {
  const factory GetPaymentResponse({
    final int? statusCode,
    final bool? status,
    final List<PaymentHistory>? data,
  }) = _GetPaymentResponse;

  factory GetPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentResponseFromJson(json);
}

@freezed
class PaymentHistory with _$PaymentHistory {
  const factory PaymentHistory({
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final int? id,
    final String? identificationId,
    final int? status,
    final String? message,
    final int? totalTax,
  }) = _PaymentHistory;

  factory PaymentHistory.fromJson(Map<String, dynamic> json) =>
      _$PaymentHistoryFromJson(json);
}
