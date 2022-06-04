import 'package:get_it/get_it.dart';
import 'package:mythic_design/data/datasources/product_remote_db.dart';
import 'package:mythic_design/data/repositories/product_impl.dart';
import 'package:mythic_design/domain/repository/product_repository.dart';
import 'package:mythic_design/domain/user_case/product_usecase.dart';
import 'package:mythic_design/presentation/provider/home_profider.dart';
import 'package:http/http.dart' as http;

final GetIt locator = GetIt.instance;

void init() async {
  // provider
  locator.registerFactory(() => HomeNotifier(getProducts: locator()));

  // use case
  locator.registerLazySingleton(() => GetProducts(locator()));

  // repository
  locator.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(remoteDataSource: locator()));

  // data source
  locator.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(locator()));

  // helper

  // External

  locator.registerLazySingleton(() => http.Client());
}
