// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_cuidapet_br/app/core/exceptions/failure.dart';
import 'package:flutter_cuidapet_br/app/core/logger/app_logger.dart';
import 'package:flutter_cuidapet_br/app/core/rest_client/rest_client.dart';
import 'package:flutter_cuidapet_br/app/core/rest_client/rest_client_exception.dart';
import 'package:flutter_cuidapet_br/app/entities/address_entity.dart';
import 'package:flutter_cuidapet_br/app/models/supplier_category_model.dart';
import 'package:flutter_cuidapet_br/app/models/supplier_nearby_me_model.dart';

import './supplier_repository.dart';

class SupplierRepositoryImpl implements SupplierRepository {
  final RestClient _restClient;
  final AppLogger _log;
  SupplierRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<List<SupplierCategoryModel>> getCategories() async {
    try {
      final result = await _restClient.auth().get('/categories/');
      return result.data
          ?.map<SupplierCategoryModel>(
            (categoryResponse) =>
                SupplierCategoryModel.fromMap(categoryResponse),
          )
          .toList();
    } on RestClient catch (e, s) {
      const message = 'Erro ao buscar categorias dos fornecedores';
      _log.error(message, e, s);
      throw Failure(message: message);
    }
  }

  @override
  Future<List<SupplierNearbyMeModel>> findNearBy(AddressEntity address) async {
    try {
      final result = await _restClient.auth().get(
        '/suppliers/',
        queryParameters: {
          'lat': address.lat,
          'lng': address.lng,
        },
      );

      return result.data
          ?.map<SupplierNearbyMeModel>(
            (supplierResponse) =>
                SupplierNearbyMeModel.fromMap(supplierResponse),
          )
          .toList();
    } on RestClientException {
      const message = 'Erro ao buscar fornecedor perto de mim.';
      _log.error(message);
      throw Failure(message: message);
    }
  }
}
