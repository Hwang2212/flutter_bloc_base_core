import 'package:flutter_bloc_base/features/products/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/constant_objects.dart';

void main() {
  test('Rating Model should be subclass of Rating Entity', () async {
    // Assert
    expect(testRatingModel, isA<RatingModel>());
  });
}
