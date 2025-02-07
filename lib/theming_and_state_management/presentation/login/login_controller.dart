import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tutorial/theming_and_state_management/domain/exception/auth_exception.dart';
import 'package:tutorial/theming_and_state_management/domain/request/login_request.dart';
import '../../domain/repository/api_repository.dart';
import '../../domain/repository/local_storage_repository.dart';

enum LoginState {
  loading,
  initial,
}

class LoginController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  LoginController({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  var loginState =LoginState.initial.obs;

  Future<bool> login() async {
    final username = usernameTextController.text;
    final password = passwordTextController.text;

    try {
      loginState(LoginState.loading);

      final loginResponse =
          await apiRepositoryInterface.login(LoginRequest(username, password));

      await localRepositoryInterface.saveToken(loginResponse.token);
      await localRepositoryInterface.saveUser(loginResponse.user);


      return true;
    } on AuthException catch (_) {
      loginState(LoginState.initial);
      return false;
    }
  }
}
