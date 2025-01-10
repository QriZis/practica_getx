import 'package:flutter/material.dart';
import 'package:tutorial/theming_and_state_management/data/models/in_memory_products.dart';
import 'package:tutorial/theming_and_state_management/domain/model/product.dart';
import 'package:tutorial/theming_and_state_management/presentation/theme.dart';
import 'package:tutorial/theming_and_state_management/presentation/widgets/delivery_button.dart';

class CartScreen extends StatelessWidget {
  final VoidCallback onShopping;

  const CartScreen({super.key, required this.onShopping});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: _FullCart(
          //   onShopping: onShopping,
          ),
    );
  }
}

//Pantalla con el carrito con productos
class _FullCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: Container(
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemExtent: 200,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return _ShoppingCartProduct(
                    product: product,
                  ); // Replace with your widget
                },
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
                                '2',
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
                              Text(
                                '222',
                                style: TextStyle(
                                    color: DeliveryColors.white, fontSize: 20),
                              ),
                             
                            ]), Spacer(),
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
  const _ShoppingCartProduct({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Stack(children: [
        Card(
          elevation: 8,
          child: Column(
            children: [
              Image.asset(
                product.image,
                width: 100, // Ajusta el ancho según tus necesidades
                height: 100, // Ajusta la altura según tus necesidades
                fit: BoxFit.cover,
              ),
              Text(
                product.name,
              ),
              Text(
                product.description,
              ),
              Row(
                children: [
                  InkWell(
                    child: Icon(Icons.remove),
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text('2'),
                  ),
                  InkWell(
                    child: Icon(Icons.add),
                    onTap: () {},
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
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: DeliveryColors.pink,
                child: Icon(Icons.delete_outline),
              )),
        ),
      ]),
    );
  }
}
