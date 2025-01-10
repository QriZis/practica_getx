import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/home_screen.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/routes/delivery_navigation.dart';
import 'package:tutorial/theming_and_state_management/presentation/main_biding.dart';
import 'package:tutorial/theming_and_state_management/presentation/splash/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: DeliveryRoutes.splash,
      getPages: DeliveryPages.pages,
      initialBinding: MainBiding(),
    );
    
  }
}
