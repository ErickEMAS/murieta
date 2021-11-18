class SignUp {

  String username;
  String email;
  String password;
  String confirmPassword;

  SignUp({
    this.username = "",
    this.email = "",
    this.password = "",
    this.confirmPassword = "",
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "password": password,
    "confirmPassword": confirmPassword,
  };

  static SignUp fromJson(Map<String, dynamic> json) {
    final signUp = new SignUp(
      username: json["username"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      confirmPassword: json["confirmPassword"] ?? "",
    );

    return signUp;
  }

}