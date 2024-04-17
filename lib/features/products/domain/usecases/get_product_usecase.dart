import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_base/common/common.dart';
import 'package:flutter_bloc_base/features/products/domain/domain.dart';

class GetTopSellingProductUseCase
    implements UseCase<List<ProductModel>, FilterProductParams> {
  GetTopSellingProductUseCase(this.repository);
  final ProductRepository repository;

  @override
  Future<Either<Failure, List<ProductModel>>> call(
      FilterProductParams params) async {
    return await repository.getTopSellingProducts();
  }
}

class FilterProductParams {
  final String? keyword;
  // final List<Category> categories;
  final double minPrice;
  final double maxPrice;
  final int? limit;
  final int? pageSize;

  const FilterProductParams({
    this.keyword = '',
    // this.categories = const [],
    this.minPrice = 0,
    this.maxPrice = 10000,
    this.limit = 0,
    this.pageSize = 10,
  });

  FilterProductParams copyWith({
    int? skip,
    String? keyword,
    // List<Category>? categories,
    double? minPrice,
    double? maxPrice,
    int? limit,
    int? pageSize,
  }) =>
      FilterProductParams(
        keyword: keyword ?? this.keyword,
        // categories: categories ?? this.categories,
        minPrice: minPrice ?? this.minPrice,
        maxPrice: maxPrice ?? this.maxPrice,
        limit: skip ?? this.limit,
        pageSize: pageSize ?? this.pageSize,
      );
}
