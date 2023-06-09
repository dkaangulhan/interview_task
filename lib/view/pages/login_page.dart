import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_health/constants/color_constants.dart';
import 'package:nano_health/view/widgets/login_input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double? initialMaxHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          //  This is for keeping column size at its
          //max size at this widget is initialized
          initialMaxHeight ??= constraints.maxHeight;
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SizedBox(
              height: constraints.maxHeight,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: initialMaxHeight,
                    child: Column(
                      children: [
                        // Brand area
                        SizedBox(
                          height: Get.height > 600
                              ? Get.height / 2
                              : Get.height / 2.5,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF188095),
                                  Color(0xFF2AB3C6),
                                ],
                              ),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/logo.png',
                                    fit: BoxFit.contain,
                                    width: 214.0 * 414.0 / Get.width,
                                    height: 117.0 * 411.0 / Get.height,
                                  ),
                                ),
                                Positioned(
                                  left: 36.0,
                                  bottom: 42.0 * 414.0 / Get.height,
                                  child: const Text(
                                    'Log In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 34.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // Input area
                        const Expanded(
                          child: LoginInputArea(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
