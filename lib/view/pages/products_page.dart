import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_health/view/controllers/product_controller.dart';
import 'package:nano_health/view/widgets/my_appbar.dart';
import 'package:nano_health/view/widgets/product_item.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final longestSide = MediaQuery.of(context).size.longestSide;
    final paddingHorizontal = longestSide > 600.0 ? 26.0 : 18.0;
    ProductController productController = Get.find();
    return Scaffold(
      appBar: MyAppBar(
        size: Size(
          Get.width,
          Get.height / 8,
        ),
        title: const Text(
          'All Products',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      ]),
      body: Obx(
        () => Container(
          padding: EdgeInsets.only(
            left: paddingHorizontal,
            top: 12.0,
            right: paddingHorizontal,
          ),
          child: productController.productList.isNotEmpty
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: productController.productList.length,
                  itemBuilder: (_, index) => ProductItem(
                    product: productController.productList[index],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
