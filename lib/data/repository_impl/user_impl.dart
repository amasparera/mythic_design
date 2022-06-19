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
   } on DatabaseException catch(e) {
      return  Left(FailureDatabase(e.message!));
    } on ServerException catch(e) {
      return  Left(FailureServer(e.message!));
    } on SocketException catch(e) {
      return  Left(FailureConnection(e.message));
    }
  }
}