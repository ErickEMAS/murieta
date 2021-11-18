import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:murieta/core/helpers/app_dio.dart';

class HttpClient {
  var dio = AppDio().instance;

  Future<Response> post({required String url, required Map body}) async {
    return await dio.post(url, data: body);
  }

}