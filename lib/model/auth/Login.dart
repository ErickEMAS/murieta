class LoginDTO {

  String email;
  String password;

  LoginDTO({
    this.email = "",
    this.password = "",
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };

  static LoginDTO fromJson(Map<String, dynamic> json) {
    final login = new LoginDTO(
      email: json["email"] ?? "",
      password: json["password"] ?? "",
    );

    return login;
  }

}