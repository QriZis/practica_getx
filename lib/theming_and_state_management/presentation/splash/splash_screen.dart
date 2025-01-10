import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial/theming_and_state_management/presentation/splash/splash_controller.dart';
import 'package:tutorial/theming_and_state_management/presentation/theme.dart';

class SplashScreen extends GetWidget<SplashController> {
  final splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: deliveryGradients
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: DeliveryColors.white,
              radius: 55,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'assets/logo.png'
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text (
              'Seguricel', 
              textAlign: TextAlign.center,
               style: TextStyle(
                fontSize: 24, // Cambia el tamaño de la letra
                color: DeliveryColors.white, // Cambia el color de la letra
              )
            ),
          ],
        ),
      ),
    );
  }
}