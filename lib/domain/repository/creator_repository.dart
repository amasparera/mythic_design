import 'package:dartz/dartz.dart';
import 'package:mythic_design/common/failure.dart';
import 'package:mythic_design/domain/enities/creator.dart';

abstract class CreatorRepository {
  Future<Either<Failure,Creator>> getCreator(String id);
}