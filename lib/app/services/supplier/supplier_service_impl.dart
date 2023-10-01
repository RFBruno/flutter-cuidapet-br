// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_cuidapet_br/app/models/supplier_category_model.dart';
import 'package:flutter_cuidapet_br/app/repositories/supplier/supplier_repository.dart';

import './supplier_service.dart';

class SupplierServiceImpl implements SupplierService {
  final SupplierRepository _repository;

  SupplierServiceImpl({
    required SupplierRepository supplierRepository,
  }) : _repository = supplierRepository;
  @override
  Future<List<SupplierCategoryModel>> getCategories() =>
      _repository.getCategories();
}
