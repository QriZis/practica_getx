import 'package:flutter/material.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/home_screen.dart';
import 'package:tutorial/theming_and_state_management/presentation/theme.dart';
import 'package:tutorial/theming_and_state_management/presentation/widgets/delivery_button.dart';

const logoSize = 40.0;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    Padding(
                      padding: const EdgeInsets.only(
                          left:
                              16.0), // Ajusta este valor para cambiar la posición
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Username',
                          style: TextStyle(
                              fontSize: 15, color: DeliveryColors.purple),
                        ),
                      ),
                    ),
                    TextField(),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left:
                              16.0), // Ajusta este valor para cambiar la posición
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 15, color: DeliveryColors.purple),
                        ),
                      ),
                    ),
                    TextField(),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(25),
            child: DeliveryButton(
              key: Key('login_button'),
              text: 'Login',
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomeScreen()));
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
