import 'package:flutter_cuidapet_br/app/modules/address/address_detail/address_detail_module.dart';
import 'package:flutter_cuidapet_br/app/modules/address/address_page.dart';
import 'package:flutter_cuidapet_br/app/modules/address/widgets/address_search_widget/address_search_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddressModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton(AddressSearchController.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(
      '/',
      child: (_) => const AddressPage(),
    );
    r.module('/detail', module: AddressDetailModule());
  }
}
