import 'package:dartz/dartz.dart';
import 'package:mythic_design/common/failure.dart';
import 'package:mythic_design/domain/enities/creator.dart';
import 'package:mythic_design/domain/repository/creator_repository.dart';

class GetCreator {
  final CreatorRepository creatorRepository;

  GetCreator(this.creatorRepository);

  Future<Either<Failure,Creator>> execute(String id)async{
    return await creatorRepository.getCreator(id);
  }
}