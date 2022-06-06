import 'package:dartz/dartz.dart';
import 'package:mythic_design/domain/enities/user.dart';

import '../../common/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser({required String userId});
}