import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:my_app/Screen/Auth/Model/Response/login_response.dart';
import '../../Screen/Auth/Model/Request/login_params.dart';
import '../../Screen/Auth/Model/Request/register_params.dart';
import '../api/api_client.dart';
import '../api/api_constant.dart';
import '../api/api_result.dart';
import '../api/network_exception.dart';
import '../api/network_info.dart';
import '../utils/storage_constants.dart';

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

        // final message = response["message"];
        // await secureStorage.write(key: Constants.message, value: message);
        return ApiResponse(data: response);
      } catch (e) {
        print('Error : $e');
        return ApiResponse(error: NetworkException.getException(e));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }

  Future<dynamic> register(RegisterParams registerParams) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await _apiClient.post(
            APIPathHelper.authAPIs(
              APIPath.register,
            ),
            data: registerParams.toJson());

        return ApiResponse(data: response);
      } catch (e) {
        return ApiResponse(error: NetworkException.getException(e));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }

  Future<dynamic> userlist(String keyword) async {
    if (await networkInfo.isConnected) {
      print(APIPathHelper.authAPIs(
        APIPath.userList,
      ));
      try {
        final response = await _apiClient.get(
          APIPathHelper.userListAPIs(
            APIPath.userList,
            keyword: keyword,
          ),
        );
        // print(response);
        // print('xys');

        return ApiResponse(data: response["data"]);
      } catch (e) {
        // print('$e');
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
