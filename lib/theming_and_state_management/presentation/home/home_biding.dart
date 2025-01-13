import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/cart/cart_controller.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/home.controller.dart';

class HomeBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        localRepositoryInterface: Get.find(),
        apiRepositoryInterface: Get.find(),
      ),
    );

    Get.lazyPut(
      () => CartController(),
    );
  }
}
