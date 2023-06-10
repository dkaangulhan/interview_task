import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nano_health/data/interfaces/iauth_service.dart';

class AuthService implements IAuthService {
  final String _url = 'https://fakestoreapi.com';
  static AuthService? _authService;

  AuthService._instance();

  static AuthService get() {
    _authService ??= AuthService._instance();
    return _authService!;
  }

  Uri getUri({String path = ''}) {
    return Uri.parse('$_url$path');
  }

  @override
  Future<http.Response> login({
    required String username,
    required String password,
  }) async {
    return await http.post(
      getUri(path: '/auth/login'),
      body: json.encode({
        'username': username,
        'password': password,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
}
