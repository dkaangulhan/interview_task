import 'package:flutter/material.dart';
import 'package:nano_health/view/pages/login_page.dart';
import 'package:nano_health/view/pages/products_page.dart';
import 'package:nano_health/view/pages/single_product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nano Health Suite Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SingleProductPage(),
    );
  }
}
