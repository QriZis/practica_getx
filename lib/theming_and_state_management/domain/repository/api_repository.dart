import 'package:tutorial/theming_and_state_management/domain/model/user.dart';
import 'package:tutorial/theming_and_state_management/domain/request/login_request.dart';
import 'package:tutorial/theming_and_state_management/domain/response/login_response.dart';

abstract class ApiRepositoryInterface {

Future<User> getUserFromToken(String token);
Future<LoginResponse> login(LoginRequest login);
Future<void> logout(String token);
}