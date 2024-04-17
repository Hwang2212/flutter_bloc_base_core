import 'package:flutter_bloc_base/features/products/products.dart';

/// Product Model
final testProductModel = ProductModel(
  id: 1,
  category: 'Some Category',
  price: 10,
  image: '',
  title: 'Some Product',
  description: 'Some Description that is very long and short',
  rating: testRatingModel,
);

/// Rating Model
final testRatingModel = RatingModel(
  count: 100,
  rate: 4.9,
);
