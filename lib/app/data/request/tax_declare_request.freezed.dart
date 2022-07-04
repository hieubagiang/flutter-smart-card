// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tax_declare_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaxDeclareRequest _$TaxDeclareRequestFromJson(Map<String, dynamic> json) {
  return _TaxDeclareRequest.fromJson(json);
}

/// @nodoc
mixin _$TaxDeclareRequest {
  int? get personalIncome => throw _privateConstructorUsedError;
  int? get deduction => throw _privateConstructorUsedError;
  int? get insuranceDeduction => throw _privateConstructorUsedError;
  int? get totalTax => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxDeclareRequestCopyWith<TaxDeclareRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxDeclareRequestCopyWith<$Res> {
  factory $TaxDeclareRequestCopyWith(
          TaxDeclareRequest value, $Res Function(TaxDeclareRequest) then) =
      _$TaxDeclareRequestCopyWithImpl<$Res>;
  $Res call(
      {int? personalIncome,
      int? deduction,
      int? insuranceDeduction,
      int? totalTax});
}

/// @nodoc
class _$TaxDeclareRequestCopyWithImpl<$Res>
    implements $TaxDeclareRequestCopyWith<$Res> {
  _$TaxDeclareRequestCopyWithImpl(this._value, this._then);

  final TaxDeclareRequest _value;
  // ignore: unused_field
  final $Res Function(TaxDeclareRequest) _then;

  @override
  $Res call({
    Object? personalIncome = freezed,
    Object? deduction = freezed,
    Object? insuranceDeduction = freezed,
    Object? totalTax = freezed,
  }) {
    return _then(_value.copyWith(
      personalIncome: personalIncome == freezed
          ? _value.personalIncome
          : personalIncome // ignore: cast_nullable_to_non_nullable
              as int?,
      deduction: deduction == freezed
          ? _value.deduction
          : deduction // ignore: cast_nullable_to_non_nullable
              as int?,
      insuranceDeduction: insuranceDeduction == freezed
          ? _value.insuranceDeduction
          : insuranceDeduction // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTax: totalTax == freezed
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_TaxDeclareRequestCopyWith<$Res>
    implements $TaxDeclareRequestCopyWith<$Res> {
  factory _$$_TaxDeclareRequestCopyWith(_$_TaxDeclareRequest value,
          $Res Function(_$_TaxDeclareRequest) then) =
      __$$_TaxDeclareRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? personalIncome,
      int? deduction,
      int? insuranceDeduction,
      int? totalTax});
}

/// @nodoc
class __$$_TaxDeclareRequestCopyWithImpl<$Res>
    extends _$TaxDeclareRequestCopyWithImpl<$Res>
    implements _$$_TaxDeclareRequestCopyWith<$Res> {
  __$$_TaxDeclareRequestCopyWithImpl(
      _$_TaxDeclareRequest _value, $Res Function(_$_TaxDeclareRequest) _then)
      : super(_value, (v) => _then(v as _$_TaxDeclareRequest));

  @override
  _$_TaxDeclareRequest get _value => super._value as _$_TaxDeclareRequest;

  @override
  $Res call({
    Object? personalIncome = freezed,
    Object? deduction = freezed,
    Object? insuranceDeduction = freezed,
    Object? totalTax = freezed,
  }) {
    return _then(_$_TaxDeclareRequest(
      personalIncome: personalIncome == freezed
          ? _value.personalIncome
          : personalIncome // ignore: cast_nullable_to_non_nullable
              as int?,
      deduction: deduction == freezed
          ? _value.deduction
          : deduction // ignore: cast_nullable_to_non_nullable
              as int?,
      insuranceDeduction: insuranceDeduction == freezed
          ? _value.insuranceDeduction
          : insuranceDeduction // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTax: totalTax == freezed
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaxDeclareRequest implements _TaxDeclareRequest {
  const _$_TaxDeclareRequest(
      {this.personalIncome,
      this.deduction,
      this.insuranceDeduction,
      this.totalTax});

  factory _$_TaxDeclareRequest.fromJson(Map<String, dynamic> json) =>
      _$$_TaxDeclareRequestFromJson(json);

  @override
  final int? personalIncome;
  @override
  final int? deduction;
  @override
  final int? insuranceDeduction;
  @override
  final int? totalTax;

  @override
  String toString() {
    return 'TaxDeclareRequest(personalIncome: $personalIncome, deduction: $deduction, insuranceDeduction: $insuranceDeduction, totalTax: $totalTax)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaxDeclareRequest &&
            const DeepCollectionEquality()
                .equals(other.personalIncome, personalIncome) &&
            const DeepCollectionEquality().equals(other.deduction, deduction) &&
            const DeepCollectionEquality()
                .equals(other.insuranceDeduction, insuranceDeduction) &&
            const DeepCollectionEquality().equals(other.totalTax, totalTax));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(personalIncome),
      const DeepCollectionEquality().hash(deduction),
      const DeepCollectionEquality().hash(insuranceDeduction),
      const DeepCollectionEquality().hash(totalTax));

  @JsonKey(ignore: true)
  @override
  _$$_TaxDeclareRequestCopyWith<_$_TaxDeclareRequest> get copyWith =>
      __$$_TaxDeclareRequestCopyWithImpl<_$_TaxDeclareRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaxDeclareRequestToJson(this);
  }
}

abstract class _TaxDeclareRequest implements TaxDeclareRequest {
  const factory _TaxDeclareRequest(
      {final int? personalIncome,
      final int? deduction,
      final int? insuranceDeduction,
      final int? totalTax}) = _$_TaxDeclareRequest;

  factory _TaxDeclareRequest.fromJson(Map<String, dynamic> json) =
      _$_TaxDeclareRequest.fromJson;

  @override
  int? get personalIncome => throw _privateConstructorUsedError;
  @override
  int? get deduction => throw _privateConstructorUsedError;
  @override
  int? get insuranceDeduction => throw _privateConstructorUsedError;
  @override
  int? get totalTax => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TaxDeclareRequestCopyWith<_$_TaxDeclareRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
