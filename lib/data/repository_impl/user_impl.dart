import 'dart:io';

import 'package:mythic_design/data/datasources/user_remote_db.dart';
import 'package:mythic_design/domain/enities/user.dart';
import 'package:mythic_design/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mythic_design/domain/repository/user_repository.dart';

import '../../common/exception.dart';

class UserRepositoryImpl implements UserRepository{
final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});


  @override
  Future<Either<Failure, User>> getUser({required String userId})async {
    try {
      final result = await userRemoteDataSource.getUser(userId: userId);
      return Right(result.toEntity());
    } on DatabaseException {
      return const Left(FailureDatabase("No product yet."));
    } on ServerException {
      return const Left(FailureServer("Filed to connect to the server."));
    } on SocketException {
      return const Left(FailureConnection("Filed to connect to the network."));
    }
  }
}