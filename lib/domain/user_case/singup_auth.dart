import 'package:mythic_design/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mythic_design/domain/enities/user.dart';
import 'package:mythic_design/domain/repository/auth_repository.dart';

class SingUpAuth {
  final AuthRepository authRepository;

  SingUpAuth(this.authRepository);

  Future<Either<Failure, User>> execute(String name, String email, String password) async {
    return await authRepository.singup(
        name: name, email: email, password: password);
  }
}
