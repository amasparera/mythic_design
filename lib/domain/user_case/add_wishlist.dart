import 'package:dartz/dartz.dart';
import 'package:mythic_design/common/failure.dart';
import 'package:mythic_design/domain/enities/product.dart';
import 'package:mythic_design/domain/repository/wishlist_repository.dart';

class AddWishlist {
  final WishlistRepository wishlistRepository;

  AddWishlist(this.wishlistRepository);

  Future<Either<Failure,String>> execute(String idUser,Product product){
    return wishlistRepository.wishlistAdd(idUser, product);
  }
}