import 'package:flutter_cuidapet_br/app/core/exceptions/failure.dart';
import 'package:flutter_cuidapet_br/app/core/helpers/environment.dart';
import 'package:flutter_cuidapet_br/app/models/place_model.dart';
import 'package:google_places/google_places.dart';

import './address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  @override
  Future<List<PlaceModel>> findAddressByGooglePlaces(
      String addressPattern) async {
    final googleApiKey = Environment.param('google_api_key');

    if (googleApiKey == null) {
      throw Failure(message: 'Google api key not found');
    }

    final googlePlaces = GooglePlaces(googleApiKey);
    final addressResult =
        await googlePlaces.search.getTextSearch(addressPattern);
    final candidates = addressResult?.results;

    if (candidates != null) {
      return candidates.map<PlaceModel>((searchResult) {
        final address = searchResult.formattedAddress ?? 'Vazio';
        final location =
            searchResult.geometry?.location ?? Location(lat: 0, lng: 0);

        return PlaceModel(
          address: address,
          lat: location.lat!,
          lng: location.lng!,
        );
      }).toList();
    }

    return <PlaceModel>[];
  }
}
