import 'package:tutorial/theming_and_state_management/domain/model/product.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tutorial/theming_and_state_management/domain/model/product.dart';

class InMemoryProducts {
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

/*
final products = [
  Product(price: 20, name: 'name', description: 'description', image: 'image'),
  Product(
      price: 20,
      name: 'La Clásica Americana',
      description:
          'Una hamburguesa tradicional con carne de res jugosa, queso cheddar derretido, lechuga fresca, tomate maduro, cebolla caramelizada y pepinillos encurtidos. Todo en un pan de sésamo suave.',
      image: 'assets/logo.png'),
  Product(
      price: 20,
      name: 'La Clásica Americana',
      description:
          'Una hamburguesa tradicional con carne de res jugosa, queso cheddar derretido, lechuga fresca, tomate maduro, cebolla caramelizada y pepinillos encurtidos. Todo en un pan de sésamo suave.',
      image: 'assets/logo.png'),
  Product(
      price: 20,
      name: 'La Clásica Americana',
      description:
          'Una hamburguesa tradicional con carne de res jugosa, queso cheddar derretido, lechuga fresca, tomate maduro, cebolla caramelizada y pepinillos encurtidos. Todo en un pan de sésamo suave.',
      image: 'assets/logo.png'),
  Product(
      price: 20,
      name: 'La Clásica Americana',
      description:
          'Una hamburguesa tradicional con carne de res jugosa, queso cheddar derretido, lechuga fresca, tomate maduro, cebolla caramelizada y pepinillos encurtidos. Todo en un pan de sésamo suave.',
      image: 'assets/logo.png'),
  Product(
      price: 20,
      name: 'La Clásica Americana',
      description:
          'Una hamburguesa tradicional con carne de res jugosa, queso cheddar derretido, lechuga fresca, tomate maduro, cebolla caramelizada y pepinillos encurtidos. Todo en un pan de sésamo suave.',
      image: 'assets/logo.png'),
];
*/