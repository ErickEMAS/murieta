import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:murieta/core/helpers/connection.helper.dart';

class AppDio {
  late Dio _dio;

  AppDio() {
    _dio = new Dio();
    _dio.options.connectTimeout = 5000; // 5s
    _dio.options.receiveTimeout = 5000; // 3s
    _dio.options.contentType = "application/json";
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (!await ConnectionHelper.hasConnection())
          throw new DioError(requestOptions: options, response: new Response(requestOptions: options, statusCode: 503, statusMessage: "No network connection."));

        return handler.next(options);
      }
    ));
  }

  Dio get instance => _dio;

}