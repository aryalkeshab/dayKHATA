class LoginParams {
  String? email;
  String? password;
  int? isThisMobileApp;

  LoginParams({this.email, this.password, this.isThisMobileApp});

  // Map<String, dynamic> toJson() => {
  //       'email': email,
  //       'password': password,
  //       'is_this_mobile_app': isThisMobileApp ?? 0,
  //     };

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    data['is_this_mobile_app'] = 1;
    return data;
  }
}
