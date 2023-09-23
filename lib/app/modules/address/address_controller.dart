// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_cuidapet_br/app/core/lify_cycle/controller_lify_cycle.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_loader.dart';
import 'package:flutter_cuidapet_br/app/entities/address_entity.dart';
import 'package:flutter_cuidapet_br/app/models/place_model.dart';
import 'package:flutter_cuidapet_br/app/services/address/address_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'address_controller.g.dart';

class AddressController = AddressControllerBase with _$AddressController;

abstract class AddressControllerBase with Store, ControllerLifyCycle {
  final AddressService _addressService;

  @readonly
  var _addresses = <AddressEntity>[];

  @readonly
  var _locationServiceUnavailable = false;

  @readonly
  LocationPermission? _locationPermission;

  @readonly
  PlaceModel? _placeModel;

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

  @action
  Future<void> myLocation() async {
    _locationPermission = null;
    _locationServiceUnavailable = false;

    final serviceEnable = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnable) {
      _locationServiceUnavailable = true;
      return;
    }

    final locationPermission = await Geolocator.checkPermission();

    switch (locationPermission) {
      case LocationPermission.denied:
        final permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          _locationPermission = permission;
          return;
        }
        break;
      case LocationPermission.deniedForever:
        _locationPermission = locationPermission;
        return;
      case LocationPermission.whileInUse:
      case LocationPermission.always:
      case LocationPermission.unableToDetermine:
        break;
      default:
    }

    CuidapetLoader.show();
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    final place = placemark.first;
    final address = '${place.thoroughfare} ${place.subThoroughfare}';
    final placeModel = PlaceModel(
        address: address, lat: position.latitude, lng: position.longitude);

    CuidapetLoader.hide();
    goToAddressDetail(placeModel);
  }

  Future<void> goToAddressDetail(PlaceModel place) async {
    final address =
        await Modular.to.pushNamed('/address/detail', arguments: place);

    if (address is PlaceModel) {
      _placeModel = address;
    }
  }
}
