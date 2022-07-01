import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:smart_card/app/data/request/tax_declare_request.dart';

import '../request/login_request.dart';
import '../response/base_response.dart';
import '../response/get_payment_response.dart';
import '../response/sign_up_response.dart';

part 'api.g.dart';

@RestApi()
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @MultiPart()
  @POST("/auth/register")
  Future<SignUpResponse> signUp({
    @Part(name: 'avatarImage') required File avatarImage,
    @Part(name: 'avatarFingerImage') required File avatarFingerImage,
    @Part(name: 'sex') required int sex,
    @Part(name: 'cardId') required String cardId,
    @Part(name: 'personalIdentification')
        required String personalIdentification,
    @Part(name: 'original') required String placeOfOrigin,
    @Part(name: 'publicKey') required String publicKey,
    @Part(name: 'autoPay') required bool autoPay,
    @Part(name: 'fullName') required String fullName,
    @Part(name: 'birthday') required String birthday,
    @Part(name: 'national') required String national,
    @Part(name: 'address') required String address,
    @Part(name: 'releaseDate') required String releaseDate,
    @Part(name: 'expiredDate') required String expiredDate,
  });

  @PUT("/users?identificationId={identificationId}")
  @MultiPart()
  Future<BaseResponse> updateProfile({
    @Path('identificationId') String identificationId = '',
    @Part(name: 'avatarImage') dynamic avatarImage = '',
    @Part(name: 'avatarFingerImage') dynamic avatarFingerImage = '',
    @Part(name: 'sex') String sex = '',
    @Part(name: 'cardId') String cardId = '',
    @Part(name: 'personalIdentification') String personalIdentification = '',
    @Part(name: 'original') String placeOfOrigin = '',
    @Part(name: 'publicKey') String publicKey = '',
    @Part(name: 'autoPay') String autoPay = '',
    @Part(name: 'fullName') String fullName = '',
    @Part(name: 'birthday') String birthday = '',
    @Part(name: 'national') String national = '',
    @Part(name: 'address') String address = '',
    @Part(name: 'releaseDate') String releaseDate = '',
    @Part(name: 'expiredDate') String expiredDate = '',
  });

  @POST("/tax?identificationId={identificationId}")
  Future<BaseResponse> declareTax(
      {@Path('identificationId') required String identificationId,
      @Body() required TaxDeclareRequest taxDeclareRequest});

  @GET("/tax?identificationId={identificationId}")
  Future<BaseResponse> getTaxs({
    @Path('identificationId') required String identificationId,
  });
  @GET("/payment?identificationId={identificationId}")
  Future<GetPaymentResponse> getPayment({
    @Path('identificationId') required String identificationId,
  });

  @PUT("/users/pay-bill?identificationId={identificationId}")
  Future<BaseResponse> payBill({
    @Path('identificationId') required String identificationId,
  });
  @POST("/auth/login")
  Future<BaseResponse> login({
    @Body() required LoginRequest loginRequest,
  });
  @GET("/users/profile?identificationId={identificationId}")
  Future<BaseResponse> getProfile({
    @Path('identificationId') required String identificationId,
  });
}
