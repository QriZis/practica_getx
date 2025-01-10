import 'package:flutter/material.dart';
import 'package:tutorial/theming_and_state_management/data/models/in_memory_products.dart';
import 'package:tutorial/theming_and_state_management/domain/model/product.dart';
import 'package:tutorial/theming_and_state_management/presentation/widgets/delivery_button.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inicio',
        ),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return _ItemProduct(
              product: product,
              );
          } 
          ),

    );
  }
}

class _ItemProduct extends StatelessWidget {
  const _ItemProduct({super.key, required this.product});
  
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(
        children: [
          Image.asset(product.image,  width: 100, // Ajusta el ancho según tus necesidades
            height: 100, // Ajusta la altura según tus necesidades
            fit: BoxFit.cover,),
          Text(product.name,),
          Text(product.description,),
          Text('\$${product.price}'),

          DeliveryButton(
              key: Key('products_button'),
              text: 'Add',
              onTap: () {},
            ),
        ],
      )
    );
  }
}