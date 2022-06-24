import 'package:dartz/dartz.dart';
import 'package:mythic_design/common/failure.dart';
import 'package:mythic_design/domain/enities/product_media_image.dart';
import 'package:mythic_design/domain/repository/creator_repository.dart';

class GetCreatorCollection {
  final CreatorRepository creatorRepository;

  GetCreatorCollection(this.creatorRepository);

  Future<Either<Failure,List<ProductMediaImage>>> execute(String id){
    return creatorRepository.getCreatorCollection(id);
  }
}