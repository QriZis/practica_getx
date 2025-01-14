import 'package:meta/meta.dart';

class Product {
  const Product({
    required this.price,
    required this.name,
    required this.description,
    required this.image,
  });

final String name;
final String description;
final double price;
final String image;

factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
    //  id: json['id'],
      name: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
    //  category: json['category'],
      image: json['image'],
    );
  }
}
