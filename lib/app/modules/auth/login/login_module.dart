import 'package:flutter_cuidapet_br/app/modules/auth/login/login_controller.dart';
import 'package:flutter_cuidapet_br/app/modules/auth/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton(LoginController.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(
      Modular.initialRoute,
      child: (_) => LoginPage(),
    );
  }
}
