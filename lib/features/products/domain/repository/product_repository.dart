import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_base/common/common.dart';
import 'package:flutter_bloc_base/features/products/products.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductModel>>> getProducts(
    FilterProductParams params,
  );

  Future<Either<Failure, List<ProductModel>>> getTopSellingProducts();
}
