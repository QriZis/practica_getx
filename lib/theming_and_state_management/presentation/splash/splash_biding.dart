import 'package:get/get.dart';
import 'package:tutorial/theming_and_state_management/presentation/splash/splash_controller.dart';

class SplashBiding extends Bindings {
  @override
  void dependencies() {
    print('SplashBiding');
    Get.lazyPut(
      () => SplashController(
          apiRepositoryInterface: Get.find(),
          localRepositoryInterface: Get.find(),
        ));
  }
}
