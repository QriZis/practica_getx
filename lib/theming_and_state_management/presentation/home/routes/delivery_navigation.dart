import 'package:get/get.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/home_biding.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/home_screen.dart';
import 'package:tutorial/theming_and_state_management/presentation/login/login_biding.dart';
import 'package:tutorial/theming_and_state_management/presentation/login/login_screen.dart';
import 'package:tutorial/theming_and_state_management/presentation/main_biding.dart';
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
      bindings: [MainBiding(), SplashBiding()],
      binding: SplashBiding(),
    ),
    GetPage(
      name: DeliveryRoutes.login,
      page: () => LoginScreen(),
      bindings: [MainBiding(), LoginBiding()],
      binding: LoginBiding(),
    ),
    GetPage(
      name: DeliveryRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBiding(),
    ),
  ];
}
