class RegisterResponse {
  bool? status;
  String? message;
  int? userId;

  RegisterResponse({this.status, this.message, this.userId});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userId = json['user_id'];
  }
}
