import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_health/constants/color_constants.dart';
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
          longestSide > 600 ? 70.0 : 70.0,
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
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/home_icon.png',
              color: myThemeBlue,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'assets/cart_icon.png',
              color: const Color(0xFFBFC2C8),
              fit: BoxFit.fill,
            ),
            Image.asset(
              'assets/like_icon.png',
              color: const Color(0xFFBFC2C8),
              fit: BoxFit.fill,
            ),
            Image.asset(
              'assets/user_icon.png',
              color: const Color(0xFFBFC2C8),
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
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
