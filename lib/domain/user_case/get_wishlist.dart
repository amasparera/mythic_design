import 'package:dartz/dartz.dart';
import 'package:mythic_design/common/failure.dart';
import 'package:mythic_design/domain/enities/wishlist.dart';
import 'package:mythic_design/domain/repository/wishlist_repository.dart';

class GetWislist{
  final WishlistRepository wishlistRepository;

  GetWislist(this.wishlistRepository);


  Future<Either<Failure,List<Wishlist>>> execute(String idWishlist){
    return  wishlistRepository.wishlistGet(idWishlist);


  }
}