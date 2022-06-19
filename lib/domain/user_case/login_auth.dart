import 'package:mythic_design/common/failure.dart';

import 'package:dartz/dartz.dart';

import '../enities/user.dart';
import '../repository/auth_repository.dart';

class LoginAuth {
  final AuthRepository authRepository;

  LoginAuth(this.authRepository);
  Future<Either<Failure, User>> execute({required String email,required String password}){
    return authRepository.login(email: email, password: password);
  }
}