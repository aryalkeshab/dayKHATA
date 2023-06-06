class UserListResponse {
  String? accno;
  String? acname;

  UserListResponse({this.accno, this.acname});

  UserListResponse.fromJson(Map<String, dynamic> json) {
    accno = json['accno'];
    acname = json['acname'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['accno'] = this.accno;
  //   data['acname'] = this.acname;
  //   return data;
  // }
}
