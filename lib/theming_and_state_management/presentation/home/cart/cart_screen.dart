import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial/theming_and_state_management/domain/model/product_cart.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/cart/cart_controller.dart';
import 'package:tutorial/theming_and_state_management/presentation/theme.dart';
import 'package:tutorial/theming_and_state_management/presentation/widgets/delivery_button.dart';

class CartScreen extends GetWidget<CartController> {
  final VoidCallback onShopping;

  const CartScreen({super.key, required this.onShopping});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(() => controller.totalItems.value == 0
              ? _EmptyCart(
                  onShopping: onShopping,
                )
              : _FullCart() //   onShopping: onShopping,
          ),
    );
  }
}

//Pantalla con el carrito con productos
class _FullCart extends GetWidget<CartController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: Container(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.cartList.length,
                  scrollDirection: Axis.horizontal,
                  itemExtent: 300,
                  itemBuilder: (context, index) {
                    final productCart = controller.cartList[index];
                    return _ShoppingCartProduct(
                      productCart: productCart,
                      onDelete: () {
                        controller.deleteProduct(productCart);
                      },
                      onIncrement: () {
                        controller.increment(productCart);
                      },
                      onDecrement: () {
                        controller.decrement(productCart);
                      },

                      
                    ); // Replace with your widget
                  },
                ),
              ),
            )),
        Expanded(
          flex: 2,
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: Card(
                  color: DeliveryColors.grey,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: TextStyle(color: DeliveryColors.white),
                              ),
                              Text(
                                '0.0',
                                style: TextStyle(color: DeliveryColors.white),
                              )
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery',
                                style: TextStyle(color: DeliveryColors.white),
                              ),
                              Text(
                                '0',
                                style: TextStyle(color: DeliveryColors.white),
                              )
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  color: DeliveryColors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Obx(() {
                                final total = controller.totalPrice.value
                                    .toStringAsFixed(2);
                                return Text(
                                  '\$$total USD',
                                  style: TextStyle(
                                      color: DeliveryColors.white,
                                      fontSize: 20),
                                );
                              }),
                            ]),
                        Spacer(),
                        DeliveryButton(
                            key: Key('cart_button'), onTap: () {}, text: 'Paga')
                      ],
                    ),
                  ))), /*  */
        ),
      ],
    );
  }
}

//Pantalla con el carrito sin productos
class _EmptyCart extends StatelessWidget {
  final VoidCallback onShopping;

  const _EmptyCart({super.key, required this.onShopping});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment
            .center, // Alinea los hijos al centro verticalmente
        children: [
          Image.asset('assets/sad.png'),
          SizedBox(height: 20), // Espacio entre la imagen y el texto
          Text('No hay objetos'),
          SizedBox(height: 20), // Espacio entre el texto y el botón
          ElevatedButton(
            onPressed: onShopping,
            style: ElevatedButton.styleFrom(
              backgroundColor: DeliveryColors.purple,
            ),
            child: Text(
              'Press Me',
              style: TextStyle(color: DeliveryColors.white),
            ),
          ),
        ],
      ),
    );
  }
}

//Smulación de los productos en el carrito
class _ShoppingCartProduct extends StatelessWidget {
  const _ShoppingCartProduct(
      {super.key,
      required this.productCart,
      required this.onDelete,
      required this.onIncrement,
      required this.onDecrement});
  final ProductCart productCart;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final product = productCart.product;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Stack(children: [
        Card(
          elevation: 8,
          child: Column(
            children: [
              Image.network(
                productCart.product.image,
                width: 100, // Ajusta el ancho según tus necesidades
                height: 100, // Ajusta la altura según tus necesidades
                fit: BoxFit.cover,
              ),
              Text(
                productCart.product.name,
              ),
              Text(
                productCart.product.description,
                style: TextStyle(
                  fontSize:
                      14.0, // Ajusta el tamaño del texto según tus necesidades
                ),
                maxLines: 2, // Limita el texto a 2 líneas
                overflow: TextOverflow
                    .ellipsis, // Agrega puntos suspensivos si el texto es demasiado largo
              ),
              Row(
                children: [
                  InkWell(
                    child: Icon(Icons.remove),
                    onTap: onDecrement,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(productCart.quantity.toString()),
                  ),
                  InkWell(
                    child: Icon(Icons.add),
                    onTap: onIncrement,
                  ),
                  Text('\$${product.price}'),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: InkWell(
              onTap: onDelete,
              child: CircleAvatar(
                backgroundColor: DeliveryColors.pink,
                child: Icon(Icons.delete_outline),
              )),
        ),
      ]),
    );
  }
}
