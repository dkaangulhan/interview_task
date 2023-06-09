import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_health/constants/color_constants.dart';
import 'package:nano_health/constants/sample_constants.dart';
import 'package:nano_health/utils/slice_text.dart';
import 'package:nano_health/view/widgets/pill_shaped_button.dart';

class SingleProductPage extends StatelessWidget {
  const SingleProductPage({super.key});

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
                    children: const [
                      BorderIcon(
                        iconData: Icons.arrow_back,
                      ),
                      BorderIcon(iconData: Icons.more_vert)
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
    return Stack(
      children: [
        Container(
          width: Get.width,
          height: Get.height - (bottomSheetHeight - bsBorderRadius),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/single_product_image_sample.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        //Bottom sheet
        Positioned(
          bottom: 0.0,
          child: Container(
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
                      children: const [
                        Text(
                          'Description',
                          style: TextStyle(
                            color: myThemeGrey,
                          ),
                        ),
                        SizedBox(
                          height: 14.0,
                        ),
                        Text(
                          '$PRODUCT_DESCRIPTION$PRODUCT_DESCRIPTION$PRODUCT_DESCRIPTION',
                        ),
                      ],
                    ),
                  ),
                ),
                isBSOpen ? const _BSReviewPart() : const SizedBox(),
              ],
            ),
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
                const Expanded(
                    child: Text(
                  'Reviews (100)',
                  style: TextStyle(
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
                      const Text(
                        '4.33',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => const Icon(
                            Icons.star,
                            color: myThemeGold,
                          ),
                        ),
                      ),
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
  const BorderIcon({
    super.key,
    required this.iconData,
    this.color = myThemeBlueDarker,
    this.size = 32.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kElevationToShadow[4],
        borderRadius: BorderRadius.circular(size / 3),
      ),
      child: Icon(
        iconData,
        color: color,
      ),
    );
  }
}
