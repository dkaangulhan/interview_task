import 'package:http/http.dart' as http;
import 'package:nano_health/data/interfaces/iproduct_service.dart';

class ProductServices implements IProductService {
  final String _url = 'https://fakestoreapi.com';
  static ProductServices? _productServices;

  ProductServices._instance();
  static ProductServices get() {
    _productServices ??= ProductServices._instance();
    return _productServices!;
  }

  Uri getUri({String path = ''}) {
    return Uri.parse('$_url$path');
  }

  @override
  Future<http.Response> getProduct(String id) async {
    return await http.get(getUri(path: '/products/$id'));
  }

  @override
  Future<http.Response> getProducts() async {
    return await http.get(getUri(path: '/products'));
  }
}
