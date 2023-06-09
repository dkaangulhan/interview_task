import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_health/constants/color_constants.dart';
import 'package:nano_health/view/widgets/my_text_field.dart';
import 'package:nano_health/view/widgets/pill_shaped_button.dart';

class LoginInputArea extends StatefulWidget {
  const LoginInputArea({super.key});

  @override
  State<LoginInputArea> createState() => _LoginInputAreaState();
}

class _LoginInputAreaState extends State<LoginInputArea> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32.0,
        right: 32.0,
        top: 32.0,
      ),
      child: Column(
        children: const [
          Expanded(
            child: MyTextField(
              hintText: 'Email',
            ),
          ),
          Expanded(
            child: MyTextField(
              hintText: 'Password',
              isPassword: true,
            ),
          ),
          PillShapedButton(label: 'Continue'),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Need Help?',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
