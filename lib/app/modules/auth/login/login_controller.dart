import 'package:flutter_cuidapet_br/app/core/exceptions/failure.dart';
import 'package:flutter_cuidapet_br/app/core/exceptions/user_not_exists_exception.dart';
import 'package:flutter_cuidapet_br/app/core/logger/app_logger.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_loader.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_messages.dart';
import 'package:flutter_cuidapet_br/app/services/user/user_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final UserService _userService;
  final AppLogger _log;
  LoginControllerBase()
      : _userService = Modular.get<UserService>(),
        _log = Modular.get<AppLogger>();

  Future<void> login(String email, String password) async {
    try {
      CuidapetLoader.show();
      await _userService.login(email, password);
      CuidapetLoader.hide();
    } on Failure catch (e, s) {
      final erroMessage = e.message ?? 'Erro ao realizar login';
      _log.error(erroMessage, e, s);
      CuidapetLoader.hide();
      CuidapetMessages.alert(erroMessage);
    } on UserNotExistsException {
      const erroMessage = 'Usuário não cadastrado';
      _log.error(erroMessage);
      CuidapetLoader.hide();
      CuidapetMessages.alert(erroMessage);
    }
  }
}
