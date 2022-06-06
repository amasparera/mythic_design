import 'package:get_it/get_it.dart';
import 'package:mythic_design/common/api_url.dart';
import 'package:mythic_design/common/helper_local.dart';
import 'package:mythic_design/data/datasources/product_remote_db.dart';
import 'package:mythic_design/data/datasources/user_remote_db.dart';
import 'package:mythic_design/data/repository_impl/user_impl.dart';
import 'package:mythic_design/domain/repository/product_repository.dart';
import 'package:mythic_design/domain/repository/user_repository.dart';
import 'package:mythic_design/domain/user_case/get_product_detail.dart';
import 'package:mythic_design/domain/user_case/get_products.dart';
import 'package:mythic_design/domain/user_case/get_user.dart';
import 'package:http/http.dart' as http;
import 'package:mythic_design/presentation/provider/detail_product_nothifier.dart';
import 'data/repository_impl/product_impl.dart';
import 'presentation/provider/home_nothifier.dart';
import 'presentation/provider/login_nothifier.dart';
import 'presentation/provider/profile_nothifier.dart';

final GetIt locator = GetIt.instance;

void init() async {
  // provider
  locator.registerFactory(
      () => HomeNotifier(getProducts: locator(), helperLocal: locator()));
  locator.registerFactory(() => ProfileNothifier(getUser: locator()));
  locator.registerFactory(
      () => ProductDetailNothifier(getProductDetail: locator()));
  locator.registerFactory(
      () => LoginNothifier());

  // use case
  locator
      .registerLazySingleton(() => GetProducts(productRepository: locator()));
  locator.registerLazySingleton(
      () => GetProductDetail(productRepository: locator()));
  locator.registerLazySingleton(() => GetUser(userRepository: locator()));

  // repository
  locator.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userRemoteDataSource: locator()));

  // data source
  locator.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(apiUrl: locator(), client: locator()));
  locator.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: locator(), apiUrl: locator()));

  // helper
  locator.registerLazySingleton(() => HelperLocal());

  // External
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => ApiUrl());
}
