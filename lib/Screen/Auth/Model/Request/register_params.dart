class RegisterParams {
  String? email;
  String? password;
  String? name;
  int? isThisMobileApp;

  RegisterParams({this.email, this.password, this.name, this.isThisMobileApp});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['is_this_mobile_app'] = this.isThisMobileApp;
    return data;
  }
}
