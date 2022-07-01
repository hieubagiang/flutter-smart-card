// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _Api implements Api {
  _Api(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SignUpResponse> signUp(
      {required avatarImage,
      required avatarFingerImage,
      required sex,
      required cardId,
      required personalIdentification,
      required placeOfOrigin,
      required publicKey,
      required autoPay,
      required fullName,
      required birthday,
      required national,
      required address,
      required releaseDate,
      required expiredDate}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'avatarImage',
        MultipartFile.fromFileSync(avatarImage.path,
            filename: avatarImage.path.split(Platform.pathSeparator).last)));
    _data.files.add(MapEntry(
        'avatarFingerImage',
        MultipartFile.fromFileSync(avatarFingerImage.path,
            filename:
                avatarFingerImage.path.split(Platform.pathSeparator).last)));
    _data.fields.add(MapEntry('sex', sex.toString()));
    _data.fields.add(MapEntry('cardId', cardId));
    _data.fields
        .add(MapEntry('personalIdentification', personalIdentification));
    _data.fields.add(MapEntry('original', placeOfOrigin));
    _data.fields.add(MapEntry('publicKey', publicKey));
    _data.fields.add(MapEntry('autoPay', autoPay.toString()));
    _data.fields.add(MapEntry('fullName', fullName));
    _data.fields.add(MapEntry('birthday', birthday));
    _data.fields.add(MapEntry('national', national));
    _data.fields.add(MapEntry('address', address));
    _data.fields.add(MapEntry('releaseDate', releaseDate));
    _data.fields.add(MapEntry('expiredDate', expiredDate));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SignUpResponse>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data')
            .compose(_dio.options, '/auth/register',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SignUpResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse> updateProfile(
      {identificationId = '',
      avatarImage = '',
      avatarFingerImage = '',
      sex = '',
      cardId = '',
      personalIdentification = '',
      placeOfOrigin = '',
      publicKey = '',
      autoPay = '',
      fullName = '',
      birthday = '',
      national = '',
      address = '',
      releaseDate = '',
      expiredDate = ''}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('avatarImage', avatarImage));
    _data.fields.add(MapEntry('avatarFingerImage', avatarFingerImage));
    _data.fields.add(MapEntry('sex', sex));
    _data.fields.add(MapEntry('cardId', cardId));
    _data.fields
        .add(MapEntry('personalIdentification', personalIdentification));
    _data.fields.add(MapEntry('original', placeOfOrigin));
    _data.fields.add(MapEntry('publicKey', publicKey));
    _data.fields.add(MapEntry('autoPay', autoPay));
    _data.fields.add(MapEntry('fullName', fullName));
    _data.fields.add(MapEntry('birthday', birthday));
    _data.fields.add(MapEntry('national', national));
    _data.fields.add(MapEntry('address', address));
    _data.fields.add(MapEntry('releaseDate', releaseDate));
    _data.fields.add(MapEntry('expiredDate', expiredDate));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse>(Options(
                method: 'PUT',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data')
            .compose(
                _dio.options, '/users?identificationId=${identificationId}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse> declareTax(
      {required identificationId, required taxDeclareRequest}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(taxDeclareRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, '/tax?identificationId=${identificationId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse> getTaxs({required identificationId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, '/tax?identificationId=${identificationId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetPaymentResponse> getPayment({required identificationId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetPaymentResponse>(Options(
                method: 'GET', headers: _headers, extra: _extra)
            .compose(
                _dio.options, '/payment?identificationId=${identificationId}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetPaymentResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse> payBill({required identificationId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    '/users/pay-bill?identificationId=${identificationId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse> login({required loginRequest}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/auth/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse> getProfile({required identificationId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    '/users/profile?identificationId=${identificationId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
