import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_loader.dart';
import 'package:flutter_cuidapet_br/app/entities/address_entity.dart';
import 'package:flutter_cuidapet_br/app/models/place_model.dart';
import 'package:flutter_cuidapet_br/app/services/address/address_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'address_detail_controller.g.dart';

class AddressDetailController = AddressDetailControllerBase
    with _$AddressDetailController;

abstract class AddressDetailControllerBase with Store {
  final AddressService _addressService;

  @readonly
  AddressEntity? _addressEntity;

  AddressDetailControllerBase()
      : _addressService = Modular.get<AddressService>();

  Future<void> saveAddress(PlaceModel placeModel, String additional) async {
    CuidapetLoader.show();
    final addressEntity =
        await _addressService.saveAddress(placeModel, additional);
    CuidapetLoader.hide();
    _addressEntity = addressEntity;
  }
}
