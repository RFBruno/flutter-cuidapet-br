import 'package:flutter_cuidapet_br/app/models/confirm_login_model.dart';
import 'package:flutter_cuidapet_br/app/models/user_model.dart';

abstract interface class UserRepository {
  Future<void> register(String email, String password);
  Future<String> login(String email, String password);
  Future<ConfirmLoginModel> confrmLogin();
  Future<UserModel> getUserLogged();
}
