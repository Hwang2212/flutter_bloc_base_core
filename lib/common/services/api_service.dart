import 'package:flutter_bloc_base/common/common.dart';

class ApiService extends BaseApiService {
  // Future<ProductDetailsModel?> getProduct(String partNumber) async {
  //   try {
  //     final url = '${ApiDefaults.baseUrl}/products/$partNumber';
  //     final response = await callApi<Json>(HttpRequestMethod.get, url);

  //     if (response == null) {
  //       return null;
  //     }

  //     final model = ProductApiModel.fromJson(response);
  //     final data = model.data;
  //     final success = model.success ?? false;
  //     final exception = model.exception;

  //     if (!success || exception != null || data == null) {
  //       return null;
  //     }

  //     return model.data;
  //   } catch (e) {
  //     return null;
  //   }
  // }
}
