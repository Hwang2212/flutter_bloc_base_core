import 'package:flutter_bloc_base/bootstrap.dart';
import 'package:flutter_bloc_base/features/app/views/app.dart';

void main() async {
  await bootstrap(() => const App());
}
