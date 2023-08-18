import 'package:flutter_cuidapet_br/app/modules/auth/register/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(
      Modular.initialRoute,
      child: (_) => const RegisterPage(),
    );
  }
}
