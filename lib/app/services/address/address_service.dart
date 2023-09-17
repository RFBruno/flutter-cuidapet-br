import 'package:flutter_cuidapet_br/app/models/place_model.dart';

abstract interface class AddressService {
  Future<List<PlaceModel>> findAddressByGooglePlaces(String addressPattern);
}
