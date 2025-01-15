import 'dart:convert';

import 'package:tutorial/theming_and_state_management/data/models/in_memory_products.dart';
import 'package:http/http.dart' as http;
//import 'package:tutorial/theming_and_state_management/data/models/product_list.dart'; // Assuming this file contains the 'products' variable
import 'package:tutorial/theming_and_state_management/domain/exception/auth_exception.dart';
import 'package:tutorial/theming_and_state_management/domain/model/product.dart';
import 'package:tutorial/theming_and_state_management/domain/model/user.dart';
import 'package:tutorial/theming_and_state_management/domain/repository/api_repository.dart';
import 'package:tutorial/theming_and_state_management/domain/request/login_request.dart';
import 'package:tutorial/theming_and_state_management/domain/response/login_response.dart';

class ApiRepositoryImpl implements ApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    //  await Future.delayed(const Duration(seconds: 3));
    if (token == 'AA111') {
      return User(
          name: 'Josep Guardiola',
          username: 'pep',
          image: 'assets/perfiles/pep.jpg');
    } else if (token == 'AA222') {
      return User(
          name: 'Johan Cruyff',
          username: 'Cruyff',
          image: 'assets/perfiles/cruyff.jpg');
    }

    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    await Future.delayed(const Duration(seconds: 3));
    if (login.username == 'pep' && login.password == 'guardiola') {
      return LoginResponse(
        'AA111',
        User(
            name: 'Josep Guardiola',
            username: 'pep',
            image: 'assets/perfiles/pep.jpg'),
      );
    }

    if (login.username == 'cruyff' && login.password == 'johan') {
      return LoginResponse(
        'AA222',
        User(
            name: 'Johan Cruyff',
            username: 'Cruyff',
            image: 'assets/perfiles/cruyff.jpg'),
      );
    }

    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('removing token from server:$token');
    return;
  }

  @override
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
  
}
