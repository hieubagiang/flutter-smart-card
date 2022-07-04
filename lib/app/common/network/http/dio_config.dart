import 'package:dio/dio.dart';

import '../../constants/constants.dart';
import '../../helper/pretty_dio_logger.dart';
import 'dio_interceptor.dart';

final Dio dio = Dio(BaseOptions(
  connectTimeout: ApiConstant.connectTimeout,
  receiveTimeout: ApiConstant.responseTimeout,
  contentType: ApiConstant.contentType,
  headers: {'Accept': 'application/json'},
  baseUrl: ApiConstant.baseUrl,
))
  ..interceptors.addAll([
    PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        request: true,
        error: true,
        compact: true,
        maxWidth: 90),
    DioInterceptor()
  ]);

/*

Dio dioProduct = Dio(BaseOptions(
  connectTimeout: Configurations.connectTimeout,
  receiveTimeout: Configurations.responseTimeout,
  contentType: Configurations.contentType,
  headers: {'Accept': 'application/json'},
  baseUrl: Configurations.productHost,
))
  ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      request: true,
      error: true,
      compact: true,
      maxWidth: 90));
*/
/*
LogInterceptor logInterceptor = LogInterceptor(
  requestHeader: kDebugMode,
  requestBody: kDebugMode,
  responseBody: kDebugMode,
  responseHeader: false,
);*/
