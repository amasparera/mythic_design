import 'dart:io';

import 'package:mythic_design/common/exception.dart';
import 'package:mythic_design/data/datasources/product_remote_db.dart';
import 'package:mythic_design/domain/enities/product.dart';
import 'package:mythic_design/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mythic_design/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final result = await remoteDataSource.getProducts();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(FailureServer(""));
    } on SocketException {
      return const Left(FailureConnection("Filed to connect to the network"));
    }
  }
}
