import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String productId;
  final String productName;
  final String productImage;
  final int productPrice;
  final String productStatusFavorite;
  final String creatorId;
  final String creatorName;
  final String creatorImage;

  const Product(
      this.productId,
      this.productName,
      this.productImage,
      this.productPrice,
      this.productStatusFavorite,
      this.creatorId,
      this.creatorName,
      this.creatorImage);

  @override
  List<Object?> get props => [
        productId,
        productImage,
        productImage,
        productName,
        productStatusFavorite,
        creatorId,
        creatorImage,
        creatorName
      ];
}
