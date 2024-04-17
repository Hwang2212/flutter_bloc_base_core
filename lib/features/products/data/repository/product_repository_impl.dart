import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_base/common/common.dart';
import 'package:flutter_bloc_base/features/products/products.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductLocalDataSource productLocalDataSource;
  final ProductRemoteDataSource productRemoteDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.productLocalDataSource,
    required this.productRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts(
      FilterProductParams params) async {
    return await _getProduct(params);
  }

  Future<Either<Failure, List<ProductModel>>> _getProduct(
    FilterProductParams params,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = productRemoteDataSource.getAllProducts(params);
        productLocalDataSource.saveProducts(remoteProducts);
        return Right(remoteProducts ?? []);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProducts = productLocalDataSource.getLastProducts();

        return Right(localProducts ?? []);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getTopSellingProducts() {
    // TODO: implement getTopSellingProducts
    throw UnimplementedError();
  }
}
