import 'package:flutter_bloc_base/features/products/domain/domain.dart';

abstract class ProductRemoteDataSource {
  List<ProductModel>? getAllProducts(FilterProductParams params);

  List<ProductModel>? getTopSellingProducts();

  ProductModel? getProductDetailByID();

  ProductModel? getProductDetailBySearchString();
}

class ProductRemoteDataSourceimpl implements ProductRemoteDataSource {
  @override
  List<ProductModel>? getAllProducts(FilterProductParams params) {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  ProductModel? getProductDetailByID() {
    // TODO: implement getProductDetailByID
    throw UnimplementedError();
  }

  @override
  ProductModel? getProductDetailBySearchString() {
    // TODO: implement getProductDetailBySearchString
    throw UnimplementedError();
  }

  @override
  List<ProductModel>? getTopSellingProducts() {
    // TODO: implement getTopSellingProducts
    throw UnimplementedError();
  }
}
