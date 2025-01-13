import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:tutorial/theming_and_state_management/presentation/login/login_controller.dart';

class LoginBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(
        apiRepositoryInterface: Get.find(),
        localRepositoryInterface: Get.find(),
      ),
    );
  }
}
