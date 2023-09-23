// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_cuidapet_br/app/core/lify_cycle/controller_lify_cycle.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_loader.dart';
import 'package:flutter_cuidapet_br/app/entities/address_entity.dart';
import 'package:flutter_cuidapet_br/app/services/address/address_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'address_controller.g.dart';

class AddressController = AddressControllerBase with _$AddressController;

abstract class AddressControllerBase with Store, ControllerLifyCycle {
  final AddressService _addressService;

  @readonly
  List<AddressEntity> _addresses = [];

  AddressControllerBase() : _addressService = Modular.get<AddressService>();

  @override
  void onReady() {
    getAdresses();
  }

  @action
  Future<void> getAdresses() async {
    CuidapetLoader.show();
    _addresses = await _addressService.getAddress();
    CuidapetLoader.hide();
  }
}
