import 'package:dartz/dartz.dart';
import 'package:mythic_design/common/failure.dart';
import 'package:mythic_design/domain/enities/product.dart';
import 'package:mythic_design/domain/repository/product_repository.dart';

class GetProducts {
  final ProductRepository productRepository;

  GetProducts({required this.productRepository});

  Future<Either<Failure, List<Product>>> execute({required int page}) {
    
    return productRepository.getProducts(page: page);
  }
}
