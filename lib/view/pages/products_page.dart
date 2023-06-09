import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_health/constants/color_constants.dart';
import 'package:nano_health/view/widgets/my_appbar.dart';
import 'package:nano_health/view/widgets/product_item.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        padding: const EdgeInsets.only(
          left: 12.0,
          top: 12.0,
          right: 12.0,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: List.generate(
            20,
            (index) => const ProductItem(),
          ),
        ),
      ),
    );
  }
}
