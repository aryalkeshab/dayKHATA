import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_app/Core/api/api_result.dart';
import 'package:my_app/Core/api_request/api_request.dart';
import 'package:my_app/Core/routes/app_pages.dart';
import 'package:my_app/Core/widgets/loading_dialog.dart';
import 'package:my_app/Screen/Auth/Model/Request/register_params.dart';

import '../../../Core/utils/toast.dart';
import '../Model/Response/register_response.dart';

class RegisterController extends GetxController {
  final ApiRequest _apiRequest = ApiRequest();

  RegisterResponse? registerResponse;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  ApiResponse registerApiResponse = ApiResponse();
  void requestRegister(
      BuildContext context, RegisterParams registerParams) async {
    showLoadingDialog(context);

    registerApiResponse = await _apiRequest.register(registerParams);
    if (context.mounted) hideLoadingDialog(context);
    if (registerApiResponse.hasData) {
      Map<String, dynamic> jsonResponse = jsonDecode(registerApiResponse.data);
      registerResponse = RegisterResponse.fromJson(jsonResponse);
      if (registerResponse!.status == true) {
        showSuccessToast(registerResponse!.message.toString());
        Get.offAllNamed(Routes.login);
      } else {
        showFailureToast(registerResponse!.message.toString());
      }
      // Get.snackbar('Welcome', registerApiResponse.data.toString());
      // authorize();
    } else if (registerApiResponse.hasError) {
      Get.snackbar('Error', registerApiResponse.error.toString());
    } else {
      Get.snackbar('Error', 'Something went wrong');
    }
  }
}
