// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_cuidapet_br/app/models/place_model.dart';
import 'package:flutter_cuidapet_br/app/services/address/address_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'address_search_controller.g.dart';

class AddressSearchController = AddressSearchControllerBase
    with _$AddressSearchController;

abstract class AddressSearchControllerBase with Store {
  final AddressService _addressService;
  AddressSearchControllerBase()
      : _addressService = Modular.get<AddressService>();

  Future<List<PlaceModel>> searchAddress(addressPattern) =>
      _addressService.findAddressByGooglePlaces(addressPattern);
}
