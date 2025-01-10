import 'package:flutter/material.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/cart_screen.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/products_screen.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/profile_screen.dart';
import 'package:tutorial/theming_and_state_management/presentation/theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: [
               ProductsScreen(),
                Text('currentIndex2: $currentIndex'),
                CartScreen(onShopping: (){
                  setState(() {
                    currentIndex = 0;
                  });
                },),
                Text('currentIndex3: $currentIndex'),
                ProfileScreen(),
              ],
            ),
          ),
          _DeliveryNavigationBar(
            index: currentIndex,
            onIndexSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;

  const _DeliveryNavigationBar({
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
            CircleAvatar(
              backgroundColor: DeliveryColors.purple,
              child: IconButton(
                icon: Icon(Icons.shopping_basket),
                onPressed: () => onIndexSelected(2),
              ),
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () => onIndexSelected(3),
            ),
            InkWell(
              onTap: () => onIndexSelected(4),
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
