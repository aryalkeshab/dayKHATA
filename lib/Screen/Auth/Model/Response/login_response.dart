class LoginResponse {
  bool? status;
  String? message;
  int? userId;

  LoginResponse({this.status, this.message, this.userId});

  LoginResponse.fromJson(json) {
    status = json['status'];
    message = json['message'];
    userId = json['user_id'];
  }
}
