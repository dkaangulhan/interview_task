import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_health/constants/color_constants.dart';
import 'package:nano_health/data/models/product_model.dart';
import 'package:nano_health/data/models/response_model.dart';
import 'package:nano_health/view/controllers/auth_controller.dart';
import 'package:nano_health/view/controllers/product_controller.dart';
import 'package:nano_health/view/pages/products_page.dart';
import 'package:nano_health/view/widgets/my_text_field.dart';
import 'package:nano_health/view/widgets/pill_shaped_button.dart';

class LoginInputArea extends StatefulWidget {
  const LoginInputArea({super.key});

  @override
  State<LoginInputArea> createState() => _LoginInputAreaState();
}

class _LoginInputAreaState extends State<LoginInputArea> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Padding(
      padding: const EdgeInsets.only(
        left: 32.0,
        right: 32.0,
        top: 32.0,
      ),
      child: Column(
        children: [
          MyTextField(
            hintText: 'Username',
            textEditingController: _usernameController,
          ),
          const SizedBox(
            height: 32.0,
          ),
          MyTextField(
            hintText: 'Password',
            textEditingController: _passwordController,
            isPassword: true,
          ),
          const SizedBox(
            height: 32.0,
          ),
          PillShapedButton(
            label: 'Continue',
            height: 54.0,
            onTap: () async {
              ResponseModel response = await authController.login(
                username: _usernameController.text,
                password: _passwordController.text,
              );

              if (response.isError) {
                return Get.dialog(_errorDialogBuilder(response));
              }

              authController.dispose();
              Get.put(ProductController());
              ProductController productController = Get.find();
              productController.getProducts();
              Get.off(const ProductsPage());
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Need Help?',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _usernameController.text = 'mor_2314';
                        _passwordController.text = '83r5^_';
                      });
                    },
                    child: const Text('Default User'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Dialog _errorDialogBuilder(ResponseModel response) {
    return Dialog(
      child: Container(
        height: Get.height * 0.4,
        padding: const EdgeInsets.only(
          left: 12.0,
          top: 16.0,
          right: 12.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              response.message ?? 'Error occurred!',
              style: const TextStyle(
                color: myThemeBlueDarker,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
