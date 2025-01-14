import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial/theming_and_state_management/data/models/in_memory_products.dart';
import 'package:tutorial/theming_and_state_management/domain/model/product.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/cart/cart_controller.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/profile/products_controller.dart';
import 'package:tutorial/theming_and_state_management/presentation/widgets/delivery_button.dart';

class ProductsScreen extends StatelessWidget {
  final controller = Get.put<ProductsController>(
    ProductsController(
      apiRepositoryInterface: Get.find(),
    ),
  );
final cartcontroller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inicio',
        ),
      ),
      body: Obx(
        () => controller.productList.isNotEmpty
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  final product = controller.productList[index];
                  return _ItemProduct(
                    product: product,
                    onTap: () {
                      cartcontroller.add(product);
                    },
                  );
                })
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  const _ItemProduct({super.key, required this.product, required this.onTap});
  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        child: Column(
          children: [
            Image.network(
              product.image, width: 100, // Ajusta el ancho según tus necesidades
              height: 100, // Ajusta la altura según tus necesidades
              fit: BoxFit.cover,
            ),
            Text(
              product.name,
            ),
            Text(
              product.description,
              style: TextStyle(
                fontSize:
                    14.0, // Ajusta el tamaño del texto según tus necesidades
              ),
              maxLines: 2, // Limita el texto a 2 líneas
              overflow: TextOverflow
                  .ellipsis, // Agrega puntos suspensivos si el texto es demasiado largo
            ),
            Text('\$${product.price}'),
            DeliveryButton(
              key: Key('products_button'),
              text: 'Add',
              onTap: onTap,
            ),
          ],
        ));
  }
}
