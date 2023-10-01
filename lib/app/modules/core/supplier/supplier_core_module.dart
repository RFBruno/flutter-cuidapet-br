import 'package:flutter_cuidapet_br/app/repositories/supplier/supplier_repository.dart';
import 'package:flutter_cuidapet_br/app/repositories/supplier/supplier_repository_impl.dart';
import 'package:flutter_cuidapet_br/app/services/supplier/supplier_service.dart';
import 'package:flutter_cuidapet_br/app/services/supplier/supplier_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SupplierCoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    super.exportedBinds(i);
    i.addLazySingleton<SupplierRepository>(SupplierRepositoryImpl.new);
    i.addLazySingleton<SupplierService>(SupplierServiceImpl.new);
  }
}
