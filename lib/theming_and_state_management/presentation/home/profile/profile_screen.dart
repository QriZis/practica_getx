import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial/theming_and_state_management/data/datasource/local_repository_impl.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/home.controller.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/routes/delivery_navigation.dart';
import 'package:tutorial/theming_and_state_management/presentation/theme.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.find<HomeController>();
  Future<void> logout() async {
    await controller.logout();
    Get.offAllNamed(DeliveryRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final user = controller.user.value;
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
          ),
          body: user.image != '' ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: DeliveryColors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(user.image),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(user.name)
              ])),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Personal info',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: logout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple, // Color morado
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: DeliveryColors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ) : const SizedBox.shrink()
        );
      },
    );
  }
}
