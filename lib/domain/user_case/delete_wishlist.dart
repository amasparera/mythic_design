import 'package:dartz/dartz.dart';
import 'package:mythic_design/common/failure.dart';
import 'package:mythic_design/domain/repository/wishlist_repository.dart';

class DeleteWishlist {
  final WishlistRepository wishlistRepository;

  DeleteWishlist(this.wishlistRepository);

  Future<Either<Failure, String>> execute(String idwish) {
    return wishlistRepository.wishlistDelete(idwish);
  }
}
