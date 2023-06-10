import 'package:flutter/material.dart';
import 'package:nano_health/constants/color_constants.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final double marginBottom;
  final TextEditingController textEditingController;
  const MyTextField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.marginBottom = 0.0,
    this.isPassword = false,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: widget.marginBottom,
      ),
      child: TextField(
        controller: widget.textEditingController,
        decoration: InputDecoration(
          labelText: widget.hintText,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: myThemeGrey,
              width: 2.0,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: myThemeGrey,
              width: 2.0,
            ),
          ),
          labelStyle: const TextStyle(
            color: myThemeBlack,
          ),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: myThemeGrey,
                    size: 22.0,
                  ),
                )
              : null,
        ),
        cursorColor: myThemeGrey,
        obscureText: widget.isPassword ? obscureText : false,
      ),
    );
  }
}
