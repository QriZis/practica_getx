import 'package:get/get.dart';
import 'package:tutorial/theming_and_state_management/domain/request/login_request.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/home_screen.dart';
import 'package:tutorial/theming_and_state_management/presentation/login/login_screen.dart';
import 'package:tutorial/theming_and_state_management/presentation/splash/splash_biding.dart';
import 'package:tutorial/theming_and_state_management/presentation/splash/splash_screen.dart';

class DeliveryRoutes {
  static final String splash = '/splash';
  static final String login = '/login';
  static final String home = '/home';
}

class DeliveryPages {
 static final pages = [
    GetPage(
      name: DeliveryRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBiding(),
    ),
    GetPage(
      name: DeliveryRoutes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: DeliveryRoutes.home,
      page: () => HomeScreen(),
    ),
  ];
}
