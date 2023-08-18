import 'package:flutter_cuidapet_br/app/modules/auth/home/auth_home_page.dart';
import 'package:flutter_cuidapet_br/app/modules/auth/login/login_module.dart';
import 'package:flutter_cuidapet_br/app/modules/auth/register/register_module.dart';
import 'package:flutter_cuidapet_br/app/modules/core/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (_) => AuthHomePage(
              authStore: Modular.get<AuthStore>(),
            ));

    r.module('/login', module: LoginModule());
    r.module('/register', module: RegisterModule());
  }
}
