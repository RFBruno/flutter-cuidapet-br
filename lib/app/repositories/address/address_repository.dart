import 'package:flutter_cuidapet_br/app/entities/address_entity.dart';

import '../../models/place_model.dart';

abstract interface class AddressRepository {
  Future<List<PlaceModel>> findAddressByGooglePlaces(String addressPattern);
  Future<List<AddressEntity>> getAddress();
  Future<void> deleteAll();
  Future<int> saveAddress(AddressEntity entity);
}
