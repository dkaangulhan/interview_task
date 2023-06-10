import 'dart:convert';

import 'package:nano_health/data/models/rating_model.dart';

class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      price: map['price'] + 0.0,
      description: map['description'],
      category: map['category'],
      image: map['image'],
      rating: RatingModel.fromMap(map['rating']),
    );
  }

  factory ProductModel.fromJson(String text) {
    final decoded = json.decode(text);
    return ProductModel.fromMap(decoded);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toMap(),
    };
  }

  String toJson() {
    return json.encode(toMap());
  }

  /// This will create product list from list of map of product.
  static List<ProductModel> fromList(List list) {
    return list.map((e) => ProductModel.fromMap(e)).toList();
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating)';
  }
}
