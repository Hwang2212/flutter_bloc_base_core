import 'package:flutter_bloc_base/features/products/domain/domain.dart';

abstract class ProductLocalDataSource {
  List<ProductModel>? getLastProducts();

  List<ProductModel>? saveProducts(List<ProductModel>? productList);
}

class ProductLocalDataSourceimpl implements ProductLocalDataSource {
  @override
  List<ProductModel>? getLastProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  List<ProductModel>? saveProducts(List<ProductModel>? productList) {
    // TODO: implement saveProducts
    throw UnimplementedError();
  }
}
