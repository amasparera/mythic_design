import 'package:dartz/dartz.dart';
import 'package:mythic_design/common/failure.dart';
import 'package:mythic_design/common/tipe_search.dart';
import 'package:mythic_design/domain/enities/product_media_image.dart';
import 'package:mythic_design/domain/repository/search_repository.dart';

class SearchProductUseCase{
  final SearchRepository searchRepository;

  SearchProductUseCase(this.searchRepository);

  Future<Either<Failure,List<ProductMediaImage>>> execute({String? text,required TypeSearch typeSearch})async{
    return searchRepository.searchProduct(typeSearch: typeSearch,text: text);
  }
}