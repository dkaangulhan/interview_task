import 'dart:convert';

import 'package:get/get.dart';
import 'package:nano_health/data/interfaces/iproduct_service.dart';
import 'package:nano_health/data/models/product_model.dart';
import 'package:nano_health/data/models/response_model.dart';
import 'package:nano_health/data/services/product_services.dart';
import 'package:http/http.dart' as http;
import 'package:nano_health/utils/http_utils.dart';

class ProductController extends GetxController {
  final IProductService _productService;
  final _productList = <ProductModel>[].obs;
  ProductModel? _currentProduct;

  ProductController({IProductService? productService})
      : _productService = productService ?? ProductServices.get();

  List<ProductModel> get productList => _productList;

  ProductModel? get currentProduct => _currentProduct;
  set setCurrentProduct(ProductModel model) => _currentProduct = model;

  Future<ResponseModel> getProducts() async {
    http.Response response = await _productService.getProducts();
    if (!checkStatusCode(response.statusCode)) {
      return ResponseModel(
        message: 'Error occurred while fetching products!',
        isError: true,
      );
    }
    final body = json.decode(response.body);
    _productList.value = ProductModel.fromList(body);
    return ResponseModel(message: 'success');
  }
}
