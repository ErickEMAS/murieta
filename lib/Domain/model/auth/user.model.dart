class UserModel {
  String id;
  String email;
  String phone;
  bool accountNonExpired;
  bool accountNonLocked;
  bool credentialsNonExpired;
  bool isEnabled;
  String facebookId;
  String permissions;

  UserModel({
    this.id = "",
    this.email = "",
    this.phone = "",
    this.accountNonExpired = false,
    this.accountNonLocked = false,
    this.credentialsNonExpired = false,
    this.isEnabled = false,
    this.facebookId = "",
    this.permissions = "",
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> rolesJson = [];

    return {
      "id": id,
      "email": email,
      "phone": phone,
      "accountNonExpired": accountNonExpired,
      "accountNonLocked": accountNonLocked,
      "credentialsNonExpired": credentialsNonExpired,
      "isEnabled": isEnabled,
      "facebookId": facebookId,
      "permissions": permissions,
      "roles": rolesJson,
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    final obj = new UserModel(
      id: json["id"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      accountNonExpired: json["accountNonExpired"] ?? false,
      accountNonLocked: json["accountNonLocked"] ?? false,
      credentialsNonExpired: json["credentialsNonExpired"] ?? false,
      isEnabled: json["isEnabled"] ?? false,
      facebookId: json["facebookId"] ?? "",
      permissions: json["permissions"] ?? "",
    );

    return obj;
  }

  static List<UserModel> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();

  static List<String> _fromStringJsonList(List<dynamic> json) => json.map((i) => i.toString()).toList();

}
