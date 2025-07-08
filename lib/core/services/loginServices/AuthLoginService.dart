

import 'package:oasisstaff/model/sourcesResponse/LoginResponse.dart';

import '../../api-control/apiManager.dart';
import '../../api-control/apiServiceProvider.dart';

class AuthLoginService {
  static Future<LoginResponse> login({
    required String username,
    required String password,
    required String deviceId,
    required String deviceType,
    required String fcmToken,
  }) async {
    final params = {
      "user": username,
      "pass": password,
      "deviceID": deviceId,
      "deviceType": deviceType,
      "FCM": fcmToken,
    };

    final response = await APIServices().apiRequest(APIManager.loginAPI, params);

    final loginResponse = LoginResponse.fromJson(response);

    return loginResponse;
  }
}