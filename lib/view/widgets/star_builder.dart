import 'package:flutter/material.dart';
import 'package:nano_health/constants/color_constants.dart';

class StarBuilder extends StatelessWidget {
  final double rating;
  final double size;
  const StarBuilder({
    super.key,
    required this.rating,
    this.size = 26.0,
  });

  @override
  Widget build(BuildContext context) {
    final integerPart = rating.floor();
    final remaining = rating - integerPart;
    return Stack(
      children: [
        Row(
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              size: size,
              color: myThemeGrey,
            ),
          ),
        ),
        Row(
          children: List.generate(
            integerPart + 1,
            (index) => Container(
              decoration: const BoxDecoration(),
              clipBehavior: Clip.hardEdge,
              width: index < integerPart ? size : size * remaining,
              child: Icon(
                Icons.star,
                size: size,
                color: myThemeGold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
