import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_app/Core/api/api_result.dart';
import 'package:my_app/Core/api_request/api_request.dart';
import 'package:my_app/Screen/Auth/Model/Request/login_params.dart';

import '../../../Core/routes/app_pages.dart';
import '../../../Core/utils/toast.dart';
import '../../../Core/widgets/loading_dialog.dart';
import '../Model/Response/login_response.dart';

class LoginController extends GetxController {
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  final ApiRequest _apiRequest = ApiRequest();

  LoginResponse? loginResponse;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  ApiResponse loginApiResponse = ApiResponse();

  void requestLogin(BuildContext context, LoginParams loginParams) async {
    showLoadingDialog(context);

    loginApiResponse = await _apiRequest.login(loginParams);
    if (context.mounted) hideLoadingDialog(context);

    if (loginApiResponse.hasData) {
      Map<String, dynamic> jsonResponse = jsonDecode(loginApiResponse.data);
      loginResponse = LoginResponse.fromJson(jsonResponse);
      if (loginResponse!.status == true) {
        showSuccessToast(loginResponse!.message.toString());
        authorize();
      } else {
        showFailureToast(loginResponse!.message.toString());
      }
    } else if (loginApiResponse.hasError) {
      Get.snackbar('Error', loginApiResponse.error.toString());
    } else {
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  void authorize() {
    Get.offAllNamed(Routes.dashboard);
  }
  // void logout() async {
  //   await secureStorage.deleteAll();
  //   Get.offAllNamed(Routes.login);
  // }
}
