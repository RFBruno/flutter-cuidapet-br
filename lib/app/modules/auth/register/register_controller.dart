import 'package:flutter_cuidapet_br/app/core/exceptions/user_exists_exception.dart';
import 'package:flutter_cuidapet_br/app/core/logger/app_logger.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_loader.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_messages.dart';
import 'package:flutter_cuidapet_br/app/services/user/user_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  final UserService _userService;
  final AppLogger _log;

  RegisterControllerBase()
      : _userService = Modular.get<UserService>(),
        _log = Modular.get<AppLogger>();

  Future<void> register(
      {required String email, required String password}) async {
    try {
      CuidapetLoader.show();
      await _userService.register(email, password);
      CuidapetMessages.info(
          'Enviamos um e-mail de confirmação, por favor olhe sua caixa de e-mail');
      CuidapetLoader.hide();
    } on UserExistsException {
      CuidapetLoader.hide();
      CuidapetMessages.alert('E-mail já utilizado, por favor escolha outro');
    } catch (e, s) {
      _log.error('Erro ao registrar usuário', e, s);
      CuidapetLoader.hide();
      CuidapetMessages.alert('Erro ao registrar usuário');
    }
  }
}
