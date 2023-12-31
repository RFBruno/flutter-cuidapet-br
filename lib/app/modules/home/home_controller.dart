import 'package:flutter_cuidapet_br/app/core/lify_cycle/controller_lify_cycle.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_loader.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_messages.dart';
import 'package:flutter_cuidapet_br/app/entities/address_entity.dart';
import 'package:flutter_cuidapet_br/app/models/supplier_category_model.dart';
import 'package:flutter_cuidapet_br/app/models/supplier_nearby_me_model.dart';
import 'package:flutter_cuidapet_br/app/services/address/address_service.dart';
import 'package:flutter_cuidapet_br/app/services/supplier/supplier_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

enum SupplierPageType { list, grid }

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store, ControllerLifyCycle {
  final AddressService _addressService;
  final SupplierService _supplierService;

  @readonly
  AddressEntity? _addressEntity;

  @readonly
  var _listCategories = <SupplierCategoryModel>[];

  @readonly
  var _supplierPageTypeSelected = SupplierPageType.list;

  @readonly
  var _listSupplierByAddress = <SupplierNearbyMeModel>[];

  late ReactionDisposer findSuppliersReactionDisposer;

  HomeControllerBase()
      : _addressService = Modular.get<AddressService>(),
        _supplierService = Modular.get<SupplierService>();

  @override
  void onInit(Map<String, dynamic>? params) {
    findSuppliersReactionDisposer = reaction((_) => _addressEntity, (address) {
      findSupplierByAddress();
    });
  }

  @override
  void dispose() {
    findSuppliersReactionDisposer();
  }

  @override
  Future<void> onReady() async {
    try {
      CuidapetLoader.show();
      await _getAddressSelected();
      await _getCategories();
    } finally {
      CuidapetLoader.hide();
    }
  }

  @action
  Future<void> _getAddressSelected() async {
    _addressEntity ??= await _addressService.getAddressSelected();

    if (_addressEntity == null) {
      goToAddressPage();
    }
  }

  @action
  Future<void> goToAddressPage() async {
    final address = await Modular.to.pushNamed<AddressEntity>('/address/');
    if (address != null) {
      _addressEntity = address;
    }
  }

  @action
  Future<void> _getCategories() async {
    try {
      final categories = await _supplierService.getCategories();
      _listCategories = [...categories];
    } catch (e) {
      CuidapetMessages.alert('Erro ao buscar categorias');
      throw Exception();
    }
  }

  @action
  Future<void> changeTabSupplier(SupplierPageType supplierPageType) async {
    _supplierPageTypeSelected = supplierPageType;
  }

  @action
  Future<void> findSupplierByAddress() async {
    if (_addressEntity != null) {
      final suppliers = await _supplierService.findNearBy(_addressEntity!);
      _listSupplierByAddress = [...suppliers];
    } else {
      CuidapetMessages.alert(
          'Para realizar a busca de petshops você precisa selecionar um endereço');
    }
  }
}
