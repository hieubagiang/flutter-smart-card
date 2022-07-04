// To parse this JSON data, do
//
//     final taxDeclareRequest = taxDeclareRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax_declare_request.freezed.dart';
part 'tax_declare_request.g.dart';

@freezed
class TaxDeclareRequest with _$TaxDeclareRequest {
  const factory TaxDeclareRequest({
    final int? personalIncome,
    final int? deduction,
    final int? insuranceDeduction,
    final int? totalTax,
  }) = _TaxDeclareRequest;

  factory TaxDeclareRequest.fromJson(Map<String, dynamic> json) =>
      _$TaxDeclareRequestFromJson(json);
}
