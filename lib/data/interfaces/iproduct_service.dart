import 'package:http/http.dart' as http;

abstract class IProductService {
  Future<http.Response> getProducts();
  Future<http.Response> getProduct(String id);
}
