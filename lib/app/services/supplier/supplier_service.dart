import 'package:flutter_cuidapet_br/app/models/supplier_category_model.dart';

abstract class SupplierService {
  Future<List<SupplierCategoryModel>> getCategories();
}
