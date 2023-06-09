import 'package:flutter/material.dart';
import 'package:nano_health/constants/color_constants.dart';

class PillShapedButton extends StatelessWidget {
  final String label;
  final double width;
  final double height;
  const PillShapedButton({
    super.key,
    required this.label,
    this.width = 300.0,
    this.height = 75.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: myThemeBlue,
        borderRadius: BorderRadius.circular(37.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          splashColor: myThemeBlueDarker,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
