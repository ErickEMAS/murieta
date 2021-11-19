import 'dart:convert';

import 'package:murieta/Domain/model/auth/user.model.dart';

class SsoDTO {
  String access_token;
  String me;

  SsoDTO({
    required this.access_token,
    required this.me,
  });

  Map<String, dynamic> toJson() => {
    "access_token": access_token,
    "me": me,
  };

  static SsoDTO fromJson(Map<String, dynamic> json) {
    final obj = new SsoDTO(
        access_token: json["access_token"] ?? "",
        me: json["me"] != null ? jsonEncode(json["me"]).toString() : ""
    );

    return obj;
  }

}