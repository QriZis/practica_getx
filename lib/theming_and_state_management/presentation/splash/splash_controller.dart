import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tutorial/theming_and_state_management/domain/repository/api_repository.dart';
import 'package:tutorial/theming_and_state_management/domain/repository/local_storage_repository.dart';
import 'package:tutorial/theming_and_state_management/presentation/home/routes/delivery_navigation.dart';
import 'package:tutorial/theming_and_state_management/presentation/splash/splash_biding.dart';

class SplashController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  SplashController({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  @override
  void onReady() {
    validateSession();
    super.onReady();
  }

  void validateSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null){
      final user = await apiRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      Get.offNamed(DeliveryRoutes.home); 

    } else {
     Get.offNamed(DeliveryRoutes.login); 
    }
  }


}
