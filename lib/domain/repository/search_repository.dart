import 'package:dartz/dartz.dart';
import 'package:mythic_design/common/failure.dart';
import 'package:mythic_design/common/tipe_search.dart';
import 'package:mythic_design/domain/enities/product_media_image.dart';

abstract class SearchRepository{
  Future<Either<Failure,List<ProductMediaImage>>> searchProduct({required TypeSearch typeSearch,String? text});
}