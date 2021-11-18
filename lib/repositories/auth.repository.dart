

import 'package:dio/dio.dart';
import 'package:murieta/helpers/endpoints.dart';
import 'package:murieta/helpers/http_client.dart';
import 'package:murieta/model/auth/Login.dart';
import 'package:murieta/model/auth/sso.dto.dart';
import 'package:murieta/model/response_model.dart';

class AuthRepository {
  final _httpClient = HttpClient();
  
  Future<ResponseModel> signIn({required LoginDTO signInDto}) async {
    final String url = Endpoints.login;

    ResponseModel response = ResponseModel();

    Map payload = {
      "email": signInDto.email,
      "password": signInDto.password
    };

    Response retLogin = await _httpClient.post(url: url, body: payload);

    final eu = retLogin;

    SsoDTO data = SsoDTO.fromJson(retLogin.data);

    response.data = data;
    response.message = "${retLogin.statusMessage}";
    response.status = retLogin.statusCode!;

    return response;
  }

}