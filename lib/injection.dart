import 'package:get_it/get_it.dart';
import 'package:mythic_design/common/helper_local.dart';
import 'package:mythic_design/data/datasources/product_remote_db.dart';
import 'package:mythic_design/data/datasources/user_remote_db.dart';
import 'package:mythic_design/domain/repository/product_repository.dart';
import 'package:mythic_design/domain/user_case/get_products.dart';
import 'package:mythic_design/domain/user_case/get_user.dart';
import 'package:http/http.dart' as http;
import 'data/repository_impl/product_impl.dart';
import 'presentation/provider/home_nothifier.dart';
import 'presentation/provider/profile_nithifier.dart';

final GetIt locator = GetIt.instance;

void init() async {
  // provider
  locator.registerFactory(
      () => HomeNotifier(getProducts: locator(), helperLocal: locator()));
  locator.registerFactory(() => ProfileNothifier(getUser: locator()));

  // use case
  locator
      .registerLazySingleton(() => GetProducts(productRepository: locator()));
  locator.registerLazySingleton(() => GetUser(userRepository: locator()));

  // repository
  locator.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(remoteDataSource: locator()));

  // data source
  locator.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: locator()));

  // helper

  locator.registerLazySingleton(() => HelperLocal());

  // External

  locator.registerLazySingleton(() => http.Client());
}
