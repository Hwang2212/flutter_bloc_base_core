import 'package:dio/dio.dart';
import 'package:flutter_bloc_base/common/core/core.dart';
import 'package:flutter_bloc_base/features/products/products.dart';
import 'package:retrofit/retrofit.dart';

part 'fake_store_api_client.g.dart';

@RestApi(baseUrl: ApiDefaults.baseUrl)
abstract class FakeStoreApiClient {
  factory FakeStoreApiClient(Dio dio, {String baseUrl}) = _FakeStoreApiClient;

  @GET('/products')
  Future<List<ProductModel>> getProducts({
    @Query('limit') int? limit,
  });

  @GET('/categories')
  Future<List<String>> getCategories();
}
