import 'package:dartz/dartz.dart';
import 'package:mythic_design/common/failure.dart';
import 'package:mythic_design/domain/enities/product.dart';
import 'package:mythic_design/domain/repository/product_repository.dart';

class GetProductDetail {
  final ProductRepository productRepository;

  GetProductDetail(this.productRepository);

  Future<Either<Failure,Product>> execute({required String productId}){
    return  productRepository.getProductDetail(productId: productId);
  }
}