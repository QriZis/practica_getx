import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/cart/cart_controller.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/cart/cart_screen.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/home.controller.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/products/products_screen.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/profile/profile_screen.dart';
import 'package:tutorial/theming_and_state_management/presentation/theme.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Obx(
              () => IndexedStack(
                index: controller.onIndexSelected.value,
                children: [
                  ProductsScreen(),
                  const Placeholder(),
                  CartScreen(
                    onShopping: () {
                      controller.onIndexSelected.value = 0;
                    },
                  ),
                  ProfileScreen(),
                ],
              ),
            ),
          ),
          Builder(
            builder: (context) {
              return Obx(
                () => _DeliveryNavigationBar(
                  index: controller.onIndexSelected.value,
                  onIndexSelected: (index) {
                    controller.updateIndexSelected(index);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;
  final controller = Get.find<HomeController>();
  final cartcontroller = Get.find<CartController>();

  _DeliveryNavigationBar({
    Key? key,
    required this.index,
    required this.onIndexSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: DeliveryColors.lightgrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () => onIndexSelected(0),
            ),
            IconButton(
              icon: Icon(Icons.store),
              onPressed: () => onIndexSelected(1),
            ),
            Stack(children: [
              CircleAvatar(
                backgroundColor: DeliveryColors.purple,
                child: IconButton(
                  icon: Icon(Icons.shopping_basket),
                  onPressed: () => onIndexSelected(2),
                ),
              ),
              Positioned(
                right: 0,
                child: Obx(
                  () => cartcontroller.totalItems.value == 0
                      ? const SizedBox.shrink()
                      : CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.pinkAccent,
                          child: Text(
                            cartcontroller.totalItems.value.toString(),
                          ),
                        ),
                ),
              )
            ]),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () => onIndexSelected(4),
            ),
            InkWell(
              onTap: () => onIndexSelected(3),
              child: Obx(
                () {
                  final user = controller.user.value;
                  return CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage(
                        user.image,
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
