import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';
import '../utils/storage_constants.dart';

class AuthInterceptor extends QueuedInterceptor {
  final Dio _dio;
  final FlutterSecureStorage storage;

  AuthInterceptor(this._dio, this.storage);
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    if (err.response?.statusCode == 401) {
      logout();
    }
    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers['requiresToken'] == false) {
      return handler.next(options);
    } else {
      final accessToken = await storage.read(key: Constants.accessToken);

      if (accessToken == null) {
        logout();
        final error =
            DioError(requestOptions: options, type: DioErrorType.other);
        return handler.reject(error);
      } else {
        options.headers.addAll(
          <String, String>{'Authorization': 'Bearer $accessToken'},
        );
        return handler.next(options);
      }
    }
  }

  void logout() {
    // showErrorToast(
    //   "Token expired. Please login again",
    // );
    // Get.find<AuthController>().logout();
    Get.key.currentState
        ?.popUntil((route) => route.settings.name == Routes.login);
  }
}
