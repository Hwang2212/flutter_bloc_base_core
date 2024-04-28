import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // //Features - Product
  // // Bloc
  // sl.registerFactory(
  //   () => ProductBloc(sl()),
  // );
  // // Use cases
  // sl.registerLazySingleton(() => GetProductUseCase(sl()));
  // // Repository
  // sl.registerLazySingleton<ProductRepository>(
  //   () => ProductRepositoryImpl(
  //     remoteDataSource: sl(),
  //     localDataSource: sl(),
  //     networkInfo: sl(),
  //   ),
  // );
  // // Data sources
  // sl.registerLazySingleton<ProductRemoteDataSource>(
  //   () => ProductRemoteDataSourceImpl(client: sl()),
  // );
  // sl.registerLazySingleton<ProductLocalDataSource>(
  //   () => ProductLocalDataSourceImpl(sharedPreferences: sl()),
  // );

  ///! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => secureStorage);

  // sl.registerLazySingleton(() => sharedPreferences);
}
