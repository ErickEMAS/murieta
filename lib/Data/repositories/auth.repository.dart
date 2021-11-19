import 'package:dio/dio.dart';
import 'package:murieta/Domain/model/auth/login.dart';
import 'package:murieta/Domain/model/auth/sso.dto.dart';
import 'package:murieta/Domain/model/response_model.dart';
import 'package:murieta/Data/source/endpoints.dart';
import 'package:murieta/core/helpers/http_client.dart';

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

    SsoDTO data = SsoDTO.fromJson(retLogin.data);

    response.data = data;
    response.message = "${retLogin.statusMessage}";
    response.status = retLogin.statusCode!;

    return response;
  }

}