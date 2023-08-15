import 'package:flutter_cuidapet_br/app/modules/core/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {

  @override
  void exportedBinds(Injector i) {
  super.exportedBinds(i);
    i.addLazySingleton(AuthStore.new);
  }

}