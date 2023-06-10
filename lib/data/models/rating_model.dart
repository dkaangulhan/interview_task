import 'dart:convert';

class RatingModel {
  double rate;
  int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromMap(Map<String, dynamic> from) {
    return RatingModel(
      rate: from['rate'] + 0.0,
      count: from['count'],
    );
  }

  factory RatingModel.fromJson(String text) {
    final decoded = json.decode(text);
    return RatingModel.fromMap(decoded);
  }

  Map<String, dynamic> toMap() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  String toJson() {
    return json.encode(toMap());
  }

  @override
  String toString() => 'RatingModel(rate: $rate, count: $count)';
}
