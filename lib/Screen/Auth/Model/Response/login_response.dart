class LoginResponse {
  bool? status;
  String? message;

  LoginResponse({this.status, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
