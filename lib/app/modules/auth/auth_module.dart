import 'package:flutter_cuidapet_br/app/modules/auth/home/auth_home_page.dart';
import 'package:flutter_cuidapet_br/app/modules/auth/login/login_module.dart';
import 'package:flutter_cuidapet_br/app/modules/auth/register/register_module.dart';
import 'package:flutter_cuidapet_br/app/modules/core/auth/auth_store.dart';
import 'package:flutter_cuidapet_br/app/repositories/user/user_repository.dart';
import 'package:flutter_cuidapet_br/app/repositories/user/user_repository_impl.dart';
import 'package:flutter_cuidapet_br/app/services/user/user_service.dart';
import 'package:flutter_cuidapet_br/app/services/user/user_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    //Modular tem inteligencia para pegar as instancias necessarias das classes
    // que estão declaradas no CoreModule
    i.addLazySingleton<UserRepository>(UserRepositoryImpl.new);
    i.addLazySingleton<UserService>(UserServiceImpl.new);
  }

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
