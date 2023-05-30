import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../Screen/Auth/Model/Request/login_params.dart';
import '../../Screen/Auth/Model/Request/register_params.dart';
import '../api/api_client.dart';
import '../api/api_constant.dart';
import '../api/api_result.dart';
import '../api/network_exception.dart';
import '../api/network_info.dart';

class ApiRequest {
  late final _apiClient = Get.find<ApiClient>();
  late final networkInfo = Get.find<NetworkInfo>();
  late final secureStorage = Get.find<FlutterSecureStorage>();

  Future<dynamic> login(LoginParams loginParams) async {
    if (await networkInfo.isConnected) {
      try {
        // print(APIPathHelper.authAPIs(
        //   APIPath.login,
        // ));
        final response = await _apiClient.post(
          APIPathHelper.authAPIs(APIPath.login),
          data: loginParams.toJson(),
        );

        // final accessToken = response["access"];
        // final name = response["name"];
        // final email = response["email"];

        // final message = response["message"];

        // await secureStorage.write(
        //     key: Constants.accessToken, value: accessToken);

        if (response["status"] == true) {
          const message = "User Logged in  Successfully!!";
          return ApiResponse(
            data: message,
          );
        } else {
          const message = "username or password invalid";
        }
        // if (response["status"] == true) {
        //   final message = response["message"].toString();
        //   return ApiResponse(data: message);
        // } else {
        //   final errorMessage = response["message"] ?? "Login failed".toString();
        //   return ApiResponse(error: errorMessage);
        // }
      } catch (e) {
        //this executes continiously
        print('Error : $e');
        return ApiResponse(error: NetworkException.getException(e));

        // return ApiResponse(error: 'error occurred');
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }

  Future<dynamic> register(RegisterParams registerParams) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await _apiClient.authPost(
            APIPathHelper.authAPIs(
              APIPath.register,
            ),
            data: registerParams.toJson());
        // return ApiResponse(
        //   data: response,
        // );
        if (response["status"] == true) {
          const message = "User Registered Successfully!!";
          return ApiResponse(
            data: message,
          );
        }
      } catch (e) {
        return ApiResponse(error: NetworkException.getException(e));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }

//   // Future<dynamic> getUsers(String requestKeyword) async {
//   //   if (await networkInfo.isConnected) {
//   //     try {
//   //       final response = await _apiClient.authGet(
//   //         APIPathHelper.authAPIs(
//   //           APIPath.register,
//   //           keyword: requestKeyword,
//   //         ),
//   //       );
//   //       final users = response
//   //           .map<UserListResponseModel>(
//   //               (e) => UserListResponseModel.fromJson(e))
//   //           .toList();

//   //       return ApiResponse(
//   //         data: users,
//   //       );
//   //     } catch (e) {
//   //       return ApiResponse(error: NetworkException.getException(e));
//   //     }
//   //   } else {
//   //     return ApiResponse(error: NetworkException.noInternetConnection());
//   //   }
//   // }
// }
}
