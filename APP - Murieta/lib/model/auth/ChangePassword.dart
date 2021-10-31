class ChangePassword {
  String password;
  String confirmPassword;

  ChangePassword({
    this.password = "",
    this.confirmPassword = "",
  });

  Map<String, dynamic> toJson() => {
    "password": password,
    "confirmPassword": confirmPassword,
  };

  static ChangePassword fromJson(Map<String, dynamic> json) {
    final changePassword = new ChangePassword(
      password: json["password"] ?? "",
      confirmPassword: json["confirmPassword"] ?? "",
    );

    return changePassword;
  }

}