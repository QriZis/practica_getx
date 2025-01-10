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
}