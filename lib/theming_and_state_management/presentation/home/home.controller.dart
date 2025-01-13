import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tutorial/theming_and_state_management/domain/model/user.dart';
import 'package:tutorial/theming_and_state_management/domain/repository/api_repository.dart';
import 'package:tutorial/theming_and_state_management/domain/repository/local_storage_repository.dart';

class HomeController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  HomeController(
      {required this.localRepositoryInterface,
      required this.apiRepositoryInterface});

  late Rx<User> user = User.empty().obs;
  RxInt onIndexSelected = 0.obs;
  

  @override
  void onReady() {
    loadUser();
    super.onReady();
  }

  void loadUser() {
    localRepositoryInterface.getUser().then(
      (value) {
        user(value);
      },
    );
  }

  void updateIndexSelected(int index) {
    onIndexSelected(index);
  }

  Future<void> logout() async {
    final token = await localRepositoryInterface.getToken();
    await apiRepositoryInterface.logout(token);
    await localRepositoryInterface.clearAllData();
  }
}
