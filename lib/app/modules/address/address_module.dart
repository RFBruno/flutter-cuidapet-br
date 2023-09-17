import 'package:flutter_cuidapet_br/app/modules/address/address_page.dart';
import 'package:flutter_cuidapet_br/app/repositories/address/address_repository.dart';
import 'package:flutter_cuidapet_br/app/repositories/address/address_repository_impl.dart';
import 'package:flutter_cuidapet_br/app/services/address/address_service.dart';
import 'package:flutter_cuidapet_br/app/services/address/address_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddressModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton<AddressRepository>(AddressRepositoryImpl.new);
    i.addLazySingleton<AddressService>(AddressServiceImpl.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(
      '/',
      child: (_) => const AddressPage(),
    );
  }
}
