import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_health/constants/color_constants.dart';
import 'package:nano_health/data/models/product_model.dart';
import 'package:nano_health/utils/slice_text.dart';
import 'package:nano_health/view/controllers/product_controller.dart';
import 'package:nano_health/view/pages/single_product_page.dart';
import 'package:nano_health/view/widgets/star_builder.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ProductController productController = Get.find();
        productController.setCurrentProduct = product;
        Get.to(
          const SingleProductPage(),
        );
      },
      child: Container(
        height: 275.0,
        margin: const EdgeInsets.only(
          bottom: 15.0,
        ),
        padding: const EdgeInsets.only(bottom: 6.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: myThemeGrey.withAlpha(50),
              width: 2.5,
            ),
          ),
        ),
        child: Column(
          children: [
            //  Image
            Expanded(
              flex: 2,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    18.0,
                  ),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      product.image,
                      fit: BoxFit.contain,
                      width: Get.width,
                    ),
                    //  Price text
                    Positioned(
                      bottom: 8.0,
                      child: Container(
                        padding: const EdgeInsets.only(left: 14.0),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                myThemeGold,
                                Colors.transparent,
                              ]),
                        ),
                        child: Text(
                          '${product.price} AED',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 14.0,
                      bottom: 8.0,
                      child: StarBuilder(
                        rating: product.rating.rate,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 17.0,
            ),
            //  Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Color(
                        0xFF444B51,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Expanded(
                    child: Text(
                      sliceText(product.description, 200),
                      style: const TextStyle(
                        color: myThemeBlueDarker,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
