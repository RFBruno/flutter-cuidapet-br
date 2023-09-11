import 'package:flutter_cuidapet_br/app/modules/home/home_controller.dart';
import 'package:flutter_cuidapet_br/app/modules/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);

    i.addLazySingleton(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);

    r.child(
      Modular.initialRoute,
      child: (_) => const HomePage(),
    );
  }
}
