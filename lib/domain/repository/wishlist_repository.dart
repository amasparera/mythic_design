import 'package:dartz/dartz.dart';
import 'package:mythic_design/common/failure.dart';
import 'package:mythic_design/domain/enities/product.dart';
import 'package:mythic_design/domain/enities/wishlist.dart';

abstract class WishlistRepository{
  Future<Either<Failure,String>>wishlistAdd(String idUser,Product product);
  Future<Either<Failure,String>>wishlistDelete(String idwish);
  Future<Either<Failure,List<Wishlist>>>wishlistGet(String idUser);
}