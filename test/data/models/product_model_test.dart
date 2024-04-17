import 'package:flutter_bloc_base/features/products/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/constant_objects.dart';

void main() {
  test('Product Model should be subclass of Product Entity', () async {
    // Assert
    expect(testProductModel, isA<ProductModel>());
  });
}
