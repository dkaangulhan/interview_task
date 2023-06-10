import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_health/constants/color_constants.dart';
import 'package:nano_health/constants/sample_constants.dart';
import 'package:nano_health/data/models/product_model.dart';
import 'package:nano_health/view/controllers/product_controller.dart';
import 'package:nano_health/view/widgets/pill_shaped_button.dart';
import 'package:nano_health/view/widgets/star_builder.dart';

class SingleProductPage extends StatelessWidget {
  const SingleProductPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            child: const PageBuilder(),
          ),
          Container(
            height: Get.height / 5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(97, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 0),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 12.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BorderIcon(
                        iconData: Icons.arrow_back,
                        onTap: () {
                          Get.back();
                        },
                      ),
                      const BorderIcon(iconData: Icons.more_vert),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Text(
                    'Detail',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PageBuilder extends StatefulWidget {
  const PageBuilder({
    super.key,
  });

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder>
    with SingleTickerProviderStateMixin {
  final bsOpenHeight = 320.0;
  final bsClosedHeight = 220.0;

  // Is bottom sheet open
  bool isBSOpen = false;
  double bottomSheetHeight = 220.0;
  final bsBorderRadius = 32.0;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _controller.addListener(
      () {
        setState(
          () {
            if (isBSOpen) {
              if (bottomSheetHeight < bsOpenHeight) {
                bottomSheetHeight += 5;
              }
            } else {
              if (bottomSheetHeight > bsClosedHeight) {
                bottomSheetHeight -= 5;
              }
            }
          },
        );
      },
    );

    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          if (isBSOpen) {
            bottomSheetHeight = bsOpenHeight;
          } else {
            bottomSheetHeight = bsClosedHeight;
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    ProductModel? product = productController.currentProduct;
    return Stack(
      children: [
        Container(
          width: Get.width,
          height: Get.height - (bottomSheetHeight - bsBorderRadius),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                product!.image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        //Bottom sheet
        Positioned(
          bottom: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white.withAlpha(120),
                      Colors.white.withAlpha(60),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 27.0, vertical: 8.0),
                  child: Text(
                    '${product.price} AED',
                    style: const TextStyle(
                      color: Color(0xFF2A404B),
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                width: Get.width,
                height: bottomSheetHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(bsBorderRadius),
                    topRight: Radius.circular(bsBorderRadius),
                  ),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      blurRadius: 8.0,
                      color: myThemeGrey,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    //  Expand icon
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isBSOpen = !isBSOpen;
                          _controller.forward(from: 0);
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Icon(
                          isBSOpen ? Icons.expand_more : Icons.expand_less,
                          color: myThemeBlue,
                          size: 32.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          BorderIcon(
                            iconData: Icons.ios_share,
                            color: myThemeBlue,
                            size: 42.0,
                          ),
                          SizedBox(
                            width: 40.0,
                          ),
                          Expanded(
                            child: PillShapedButton(
                              label: 'Order Now',
                              height: 42.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    //  Description
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            const Text(
                              'Description',
                              style: TextStyle(
                                color: myThemeGrey,
                              ),
                            ),
                            const SizedBox(
                              height: 14.0,
                            ),
                            Text(
                              product.description,
                            ),
                          ],
                        ),
                      ),
                    ),
                    bottomSheetHeight == bsOpenHeight
                        ? const _BSReviewPart()
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

/// Bottom sheet reviews part
class _BSReviewPart extends StatelessWidget {
  const _BSReviewPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    ProductModel? product = productController.currentProduct;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.only(top: 8.0),
          clipBehavior: Clip.hardEdge,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Color(0xffF1F1F1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  'Reviews (${product!.rating.count})',
                  style: const TextStyle(
                    color: myThemeGrey,
                    fontSize: 16.0,
                  ),
                )),
                const SizedBox(
                  height: 12.0,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        '${product.rating.rate}',
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      StarBuilder(rating: product.rating.rate)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BorderIcon extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final double size;
  final Function()? onTap;
  const BorderIcon({
    super.key,
    required this.iconData,
    this.color = myThemeBlueDarker,
    this.size = 32.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kElevationToShadow[4],
        borderRadius: BorderRadius.circular(size / 3),
      ),
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Icon(
            iconData,
            color: color,
          ),
        ),
      ),
    );
  }
}
