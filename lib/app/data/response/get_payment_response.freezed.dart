// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_payment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetPaymentResponse _$GetPaymentResponseFromJson(Map<String, dynamic> json) {
  return _GetPaymentResponse.fromJson(json);
}

/// @nodoc
mixin _$GetPaymentResponse {
  int? get statusCode => throw _privateConstructorUsedError;
  bool? get status => throw _privateConstructorUsedError;
  List<PaymentHistory>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetPaymentResponseCopyWith<GetPaymentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPaymentResponseCopyWith<$Res> {
  factory $GetPaymentResponseCopyWith(
          GetPaymentResponse value, $Res Function(GetPaymentResponse) then) =
      _$GetPaymentResponseCopyWithImpl<$Res>;
  $Res call({int? statusCode, bool? status, List<PaymentHistory>? data});
}

/// @nodoc
class _$GetPaymentResponseCopyWithImpl<$Res>
    implements $GetPaymentResponseCopyWith<$Res> {
  _$GetPaymentResponseCopyWithImpl(this._value, this._then);

  final GetPaymentResponse _value;
  // ignore: unused_field
  final $Res Function(GetPaymentResponse) _then;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PaymentHistory>?,
    ));
  }
}

/// @nodoc
abstract class _$$_GetPaymentResponseCopyWith<$Res>
    implements $GetPaymentResponseCopyWith<$Res> {
  factory _$$_GetPaymentResponseCopyWith(_$_GetPaymentResponse value,
          $Res Function(_$_GetPaymentResponse) then) =
      __$$_GetPaymentResponseCopyWithImpl<$Res>;
  @override
  $Res call({int? statusCode, bool? status, List<PaymentHistory>? data});
}

/// @nodoc
class __$$_GetPaymentResponseCopyWithImpl<$Res>
    extends _$GetPaymentResponseCopyWithImpl<$Res>
    implements _$$_GetPaymentResponseCopyWith<$Res> {
  __$$_GetPaymentResponseCopyWithImpl(
      _$_GetPaymentResponse _value, $Res Function(_$_GetPaymentResponse) _then)
      : super(_value, (v) => _then(v as _$_GetPaymentResponse));

  @override
  _$_GetPaymentResponse get _value => super._value as _$_GetPaymentResponse;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_GetPaymentResponse(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PaymentHistory>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetPaymentResponse implements _GetPaymentResponse {
  const _$_GetPaymentResponse(
      {this.statusCode, this.status, final List<PaymentHistory>? data})
      : _data = data;

  factory _$_GetPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetPaymentResponseFromJson(json);

  @override
  final int? statusCode;
  @override
  final bool? status;
  final List<PaymentHistory>? _data;
  @override
  List<PaymentHistory>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetPaymentResponse(statusCode: $statusCode, status: $status, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetPaymentResponse &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(statusCode),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_GetPaymentResponseCopyWith<_$_GetPaymentResponse> get copyWith =>
      __$$_GetPaymentResponseCopyWithImpl<_$_GetPaymentResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetPaymentResponseToJson(this);
  }
}

abstract class _GetPaymentResponse implements GetPaymentResponse {
  const factory _GetPaymentResponse(
      {final int? statusCode,
      final bool? status,
      final List<PaymentHistory>? data}) = _$_GetPaymentResponse;

  factory _GetPaymentResponse.fromJson(Map<String, dynamic> json) =
      _$_GetPaymentResponse.fromJson;

  @override
  int? get statusCode => throw _privateConstructorUsedError;
  @override
  bool? get status => throw _privateConstructorUsedError;
  @override
  List<PaymentHistory>? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GetPaymentResponseCopyWith<_$_GetPaymentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentHistory _$PaymentHistoryFromJson(Map<String, dynamic> json) {
  return _PaymentHistory.fromJson(json);
}

/// @nodoc
mixin _$PaymentHistory {
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get identificationId => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get totalTax => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentHistoryCopyWith<PaymentHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentHistoryCopyWith<$Res> {
  factory $PaymentHistoryCopyWith(
          PaymentHistory value, $Res Function(PaymentHistory) then) =
      _$PaymentHistoryCopyWithImpl<$Res>;
  $Res call(
      {DateTime? createdAt,
      DateTime? updatedAt,
      int? id,
      String? identificationId,
      int? status,
      String? message,
      int? totalTax});
}

/// @nodoc
class _$PaymentHistoryCopyWithImpl<$Res>
    implements $PaymentHistoryCopyWith<$Res> {
  _$PaymentHistoryCopyWithImpl(this._value, this._then);

  final PaymentHistory _value;
  // ignore: unused_field
  final $Res Function(PaymentHistory) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? id = freezed,
    Object? identificationId = freezed,
    Object? status = freezed,
    Object? message = freezed,
    Object? totalTax = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      identificationId: identificationId == freezed
          ? _value.identificationId
          : identificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      totalTax: totalTax == freezed
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_PaymentHistoryCopyWith<$Res>
    implements $PaymentHistoryCopyWith<$Res> {
  factory _$$_PaymentHistoryCopyWith(
          _$_PaymentHistory value, $Res Function(_$_PaymentHistory) then) =
      __$$_PaymentHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime? createdAt,
      DateTime? updatedAt,
      int? id,
      String? identificationId,
      int? status,
      String? message,
      int? totalTax});
}

/// @nodoc
class __$$_PaymentHistoryCopyWithImpl<$Res>
    extends _$PaymentHistoryCopyWithImpl<$Res>
    implements _$$_PaymentHistoryCopyWith<$Res> {
  __$$_PaymentHistoryCopyWithImpl(
      _$_PaymentHistory _value, $Res Function(_$_PaymentHistory) _then)
      : super(_value, (v) => _then(v as _$_PaymentHistory));

  @override
  _$_PaymentHistory get _value => super._value as _$_PaymentHistory;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? id = freezed,
    Object? identificationId = freezed,
    Object? status = freezed,
    Object? message = freezed,
    Object? totalTax = freezed,
  }) {
    return _then(_$_PaymentHistory(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      identificationId: identificationId == freezed
          ? _value.identificationId
          : identificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      totalTax: totalTax == freezed
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentHistory implements _PaymentHistory {
  const _$_PaymentHistory(
      {this.createdAt,
      this.updatedAt,
      this.id,
      this.identificationId,
      this.status,
      this.message,
      this.totalTax});

  factory _$_PaymentHistory.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentHistoryFromJson(json);

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final int? id;
  @override
  final String? identificationId;
  @override
  final int? status;
  @override
  final String? message;
  @override
  final int? totalTax;

  @override
  String toString() {
    return 'PaymentHistory(createdAt: $createdAt, updatedAt: $updatedAt, id: $id, identificationId: $identificationId, status: $status, message: $message, totalTax: $totalTax)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentHistory &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.identificationId, identificationId) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.totalTax, totalTax));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(identificationId),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(totalTax));

  @JsonKey(ignore: true)
  @override
  _$$_PaymentHistoryCopyWith<_$_PaymentHistory> get copyWith =>
      __$$_PaymentHistoryCopyWithImpl<_$_PaymentHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentHistoryToJson(this);
  }
}

abstract class _PaymentHistory implements PaymentHistory {
  const factory _PaymentHistory(
      {final DateTime? createdAt,
      final DateTime? updatedAt,
      final int? id,
      final String? identificationId,
      final int? status,
      final String? message,
      final int? totalTax}) = _$_PaymentHistory;

  factory _PaymentHistory.fromJson(Map<String, dynamic> json) =
      _$_PaymentHistory.fromJson;

  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get identificationId => throw _privateConstructorUsedError;
  @override
  int? get status => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  int? get totalTax => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentHistoryCopyWith<_$_PaymentHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
