import 'package:http/http.dart' as http;

abstract class IAuthService {
  Future<http.Response> login(
      {required String username, required String password});
}
