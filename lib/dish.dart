import 'dart:convert';
import 'package:http/http.dart' as http;

class Dish {
  static const apiUrl =
      "https://sebstreb.github.io/binv2110-examen-blanc-api/dishes";

  final int id;
  final String name;
  final double price;
  final String category;
  final String imagePath;

  const Dish({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imagePath,
  });

  Dish.fromJson(Map<String, dynamic> json)
      : this(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    category: json["category"],
    imagePath: json["imagePath"],
  );

  static Future<List<Dish>> fetchDishes() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Dish.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load dishes');
    }
  }
}
