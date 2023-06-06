import 'dart:convert';

import 'package:get/get.dart';

import '../../../Core/api/api_result.dart';
import '../../../Core/api_request/api_request.dart';
import '../Model/Response/user_list_response.dart';

class AmountReceivedController extends GetxController {
  final ApiRequest _apiRequest = ApiRequest();

  @override
  void onInit() {
    getUserList("");

    super.onInit();
  }

  ApiResponse _userListApiResponse = ApiResponse();

  List<UserListResponse> userListResponse = [];
  List<String> usernameList = [];
  set userListApiResponse(ApiResponse userListApiResponse) {
    _userListApiResponse = userListApiResponse;
    update();
  }

  ApiResponse get userListApiResponse => _userListApiResponse;

  void getUserList(String keyword) async {
    // showLoadingDialog(context);

    userListResponse = []; //before making api request this list is cleared
    usernameList = [];

    userListApiResponse = await _apiRequest.userlist(keyword);

    // print(userListApiResponse );
    // print('h7');
    //this above line api requires is made here and the results stored on userListApiResponse

    if (userListApiResponse.hasData) {
      // Map<String, dynamic> jsonResponse = jsonDecode(userListApiResponse.data);
      // print(jsonResponse);

      // userListResponse = UserListResponse.fromJson(jsonResponse);
      userListResponse = userListApiResponse.data
          .map<UserListResponse>(
              (product) => UserListResponse.fromJson(product))
          .toList();
      for (var element in userListResponse) {
        usernameList.add(element.acname.toString());
      }
      // print(userListResponse);
      // print(userListResponse.first.acname);
    } else if (userListApiResponse.hasError) {
      Get.snackbar('Oops', userListApiResponse.error.toString());
    } else {
      Get.snackbar('Ops', 'Something went wrong');
    }
  }
}



// }