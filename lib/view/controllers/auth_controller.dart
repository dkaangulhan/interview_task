import 'dart:convert';

import 'package:get/get.dart';
import 'package:nano_health/data/interfaces/iauth_service.dart';
import 'package:nano_health/data/models/response_model.dart';
import 'package:nano_health/data/services/auth_service.dart';
import 'package:nano_health/utils/http_utils.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final IAuthService _authService;

  AuthController({IAuthService? authService})
      : _authService = authService ?? AuthService.get();

  Future<ResponseModel> login({
    required String username,
    required String password,
  }) async {
    try {
      http.Response response = await _authService.login(
        username: username,
        password: password,
      );
      if (!checkStatusCode(response.statusCode)) {
        return ResponseModel(
          message: response.body,
          isError: true,
        );
      }
      final body = json.decode(response.body);
      return ResponseModel(message: body['token']);
    } catch (e) {
      return ResponseModel(
        message: 'Error occurred while logging in!',
        isError: true,
      );
    }
  }
}
