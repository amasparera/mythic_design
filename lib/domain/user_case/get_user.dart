import 'package:dartz/dartz.dart';
import 'package:mythic_design/domain/enities/user.dart';
import 'package:mythic_design/domain/repository/user_repository.dart';

import '../../common/failure.dart';

class GetUser {
  final UserRepository userRepository;

  GetUser({required this.userRepository});

  Future<Either<Failure, User>> execute({required String id}) {
    return userRepository.getUser(userId: id);
  }
}
