import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/home_screen.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/routes/delivery_navigation.dart';
import 'package:tutorial/theming_and_state_management/presentation/login/login_controller.dart';
import 'package:tutorial/theming_and_state_management/presentation/theme.dart';
import 'package:tutorial/theming_and_state_management/presentation/widgets/delivery_button.dart';

const logoSize = 40.0;

class LoginScreen extends GetWidget<LoginController> {
  void login() async {
    final result = await controller.login();
    if (result) {
      Get.offAllNamed(DeliveryRoutes.home);
    } else {
      Get.snackbar(
        'Error',
        'Login incorrecto',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Positioned.fill(
                      bottom: logoSize,
                      child: ClipPath(
                        clipper: SemiCircleClipper(),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: deliveryGradients),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: logoSize,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset('assets/logo.png'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 4,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: DeliveryColors.purple),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: controller.usernameTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: DeliveryColors.purple,
                            ),
                            hintText: 'Username',
                          ),
                        ),
                        TextField(
                          controller: controller.passwordTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: DeliveryColors.purple,
                            ),
                            hintText: 'Username',
                          ),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(25),
                child: DeliveryButton(
                  key: Key('login_button'),
                  text: 'Login',
                  onTap: login,
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Obx(
              () { 
                if (controller.loginState.value == LoginState.loading) {
                  return Container(
                    color: Colors.black26,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                else{
                  return SizedBox.shrink();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

//Curva de la parte superior
class SemiCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - logoSize);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - logoSize,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
