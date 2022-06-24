import 'dart:io';

import 'package:mythic_design/data/datasources/creator_remote.dart';
import 'package:mythic_design/domain/enities/creator.dart';
import 'package:mythic_design/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mythic_design/domain/enities/product_media_image.dart';
import 'package:mythic_design/domain/repository/creator_repository.dart';

import '../../common/exception.dart';

class CreatorRepositoryImpl implements CreatorRepository {
  final CreatorRemoteRepository creatorRemoteRepository;

  CreatorRepositoryImpl(this.creatorRemoteRepository);
  @override
  Future<Either<Failure, Creator>> getCreator(String id) async {
    try {
      final result = await creatorRemoteRepository.getCreator(id);
      return Right(result.toEntity());
    } on DatabaseException catch (e) {
      return Left(FailureDatabase(e.message!));
    } on ServerException catch (e) {
      return Left(FailureServer(e.message!));
    } on SocketException catch (e) {
      return Left(FailureConnection(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ProductMediaImage>>> getCreatorCollection(
      String id) async {
    try {
      final result = await creatorRemoteRepository.getCreatorCollection(id);
      return Right(result.map((e) => e.toEnities()).toList());
    } on DatabaseException catch (e) {
      return Left(FailureDatabase(e.message!));
    } on ServerException catch (e) {
      return Left(FailureServer(e.message!));
    } on SocketException catch (e) {
      return Left(FailureConnection(e.message));
    }
  }
}
