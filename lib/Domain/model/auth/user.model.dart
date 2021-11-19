class UserModel {
  int id;
  String name;
  String email;
  bool accountNonExpired;
  bool accountNonLocked;
  bool credentialsNonExpired;
  bool isEnabled;

  UserModel({
    this.id = 0,
    this.name = "",
    this.email = "",
    this.accountNonExpired = false,
    this.accountNonLocked = false,
    this.credentialsNonExpired = false,
    this.isEnabled = false,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> rolesJson = [];

    return {
      "id": id,
      "email": email,
      "name": name,
      "accountNonExpired": accountNonExpired,
      "accountNonLocked": accountNonLocked,
      "credentialsNonExpired": credentialsNonExpired,
      "isEnabled": isEnabled,
      "roles": rolesJson,
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    final obj = new UserModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      accountNonExpired: json["accountNonExpired"] ?? false,
      accountNonLocked: json["accountNonLocked"] ?? false,
      credentialsNonExpired: json["credentialsNonExpired"] ?? false,
      isEnabled: json["isEnabled"] ?? false,
    );

    return obj;
  }

  static List<UserModel> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();

  static List<String> _fromStringJsonList(List<dynamic> json) => json.map((i) => i.toString()).toList();

}
