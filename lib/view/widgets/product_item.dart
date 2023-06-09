import 'package:flutter/material.dart';
import 'package:nano_health/constants/color_constants.dart';
import 'package:nano_health/constants/sample_constants.dart';
import 'package:nano_health/utils/slice_text.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 309.0,
      margin: const EdgeInsets.only(
        bottom: 5.0,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: myThemeGrey,
          ),
        ),
      ),
      child: Column(
        children: [
          //  Image
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                18.0,
              ),
            ),
            child: Stack(
              children: [
                Image.asset(
                  'assets/product_image_sample.png',
                  fit: BoxFit.fill,
                ),
                //  Price text
                const Positioned(
                  left: 14.0,
                  bottom: 8.0,
                  child: Text(
                    '000 AED',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  right: 14.0,
                  bottom: 8.0,
                  child: Row(
                    children: List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star,
                        size: 26.0,
                        color: myThemeGold,
                      ),
                    ),
                  ),
                ),
              ],
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
                const Text(
                  'Title',
                  style: TextStyle(
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
                    sliceText(PRODUCT_DESCRIPTION, 120),
                    style: const TextStyle(
                      color: myThemeBlueDarker,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
