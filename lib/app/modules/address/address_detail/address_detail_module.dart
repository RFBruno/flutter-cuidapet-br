import 'package:flutter_cuidapet_br/app/modules/address/address_detail/address_detail_controller.dart';
import 'package:flutter_cuidapet_br/app/modules/address/address_detail/address_detail_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddressDetailModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton(AddressDetailController.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(
      '/',
      child: (_) => AddressDetailPage(
        place: r.args.data,
      ),
    );
  }
}
