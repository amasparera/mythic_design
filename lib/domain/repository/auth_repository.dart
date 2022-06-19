import 'package:dartz/dartz.dart';
import 'package:mythic_design/common/failure.dart';
import 'package:mythic_design/domain/enities/user.dart';

abstract class AuthRepository{
  Future<Either<Failure,User>> login({required String email,required String password});
  Future<Either<Failure,User>> singup({required String name, required String email,required String password});
}