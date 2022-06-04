import 'package:equatable/equatable.dart';
import 'package:mythic_design/domain/enities/product.dart';

class ProductModel extends Equatable {
  final String productId;
  final String productName;
  final String productImage;
  final String productPrice;
  final String productStatusFavorite;
  final String creatorId;
  final String creatorName;
  final String creatorImage;

  const ProductModel(
      {required this.productId,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.productStatusFavorite,
      required this.creatorId,
      required this.creatorName,
      required this.creatorImage});

  factory ProductModel.fromjson(Map<String, dynamic> map) {
    return ProductModel(
        productId: map["product_id"],
        productName: map["product_name"],
        productImage: map["product_image"],
        productPrice: map["product_price"],
        productStatusFavorite: map["product_satus_favorite"],
        creatorId: map["creator_id"],
        creatorName: map["creator_name"],
        creatorImage: map["creator_name"]);
  }

  Product toEntity() {
    return Product(
        productId,
        productName,
        productImage,
        int.parse(productPrice),
        productStatusFavorite,
        creatorId,
        creatorName,
        creatorImage);
  }

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
