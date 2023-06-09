import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size size;
  final Widget title;
  const MyAppBar({
    super.key,
    required this.title,
    required this.size,
  });

  @override
  Size get preferredSize => size;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromARGB(136, 107, 127, 153),
            blurRadius: 12.0,
          ),
        ],
      ),
      child: Center(child: title),
    );
  }
}
