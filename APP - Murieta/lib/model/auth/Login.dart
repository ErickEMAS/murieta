class Login {

  String email;
  String password;

  Login({
    this.email = "",
    this.password = "",
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };

  static Login fromJson(Map<String, dynamic> json) {
    final login = new Login(
      email: json["email"] ?? "",
      password: json["password"] ?? "",
    );

    return login;
  }

}