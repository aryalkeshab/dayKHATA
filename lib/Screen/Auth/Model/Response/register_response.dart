class RegisterResponse {
  String? email;
  String? password;
  String? name;
  int? isThisMobileApp;

  RegisterResponse(
      {this.email, this.password, this.name, this.isThisMobileApp});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    isThisMobileApp = json['is_this_mobile_app'];
  }
}
