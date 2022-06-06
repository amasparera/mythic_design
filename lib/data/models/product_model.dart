import 'package:equatable/equatable.dart';
import 'package:mythic_design/domain/enities/product.dart';
import 'package:mythic_design/domain/enities/product_media_image.dart';
import 'product_media_image_model.dart';

class ProductModel extends Equatable {
  final String productId;
  final String productName;
  final String productImage;
  final String productPrice;
  final String productStatusFavorite;
  final String creatorId;
  final String creatorName;
  final String creatorImage;
  final String? totalBuy;
  final String? totalFavorite;
  final String? description;
  final List<ProductMediaImageModel>? listMediaImage;

  const ProductModel({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productStatusFavorite,
    required this.creatorId,
    required this.creatorName,
    required this.creatorImage,
    this.totalBuy,
    this.totalFavorite,
    this.description,
    this.listMediaImage,
  });

  factory ProductModel.fromjson(Map<String, dynamic> map) {
    return ProductModel(
        productId: map["ProductId"],
        productName: map["ProductName"],
        productImage: map["ProductImage"],
        productPrice: map["ProductPrice"],
        productStatusFavorite: map["product_satus_favorite"] ?? "0",
        creatorId: map["CreatorId"],
        creatorName: map["CreatorName"],
        creatorImage: map["CreatorImage"],
        description: map["Description"],
        totalBuy: map["TotalBuy"],
        totalFavorite: map["TotalFavorite"],
        listMediaImage: map["ListMediaImage"] != null
            ? (map["ListMediaImage"] as List<dynamic>)
                .map((e) => ProductMediaImageModel.fromjson(e))
                .toList()
            : null);
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
        creatorImage,
        description: description,
        totalBuy: int.parse(totalBuy ?? "0"),
        totalFavorite: int.parse(totalFavorite ?? "0"),
        listMediaImage: listMediaImage != null
            ? listMediaImage!
                .map((e) => ProductMediaImage(
                    id: e.id,
                    creatorId: e.creatorId,
                    productId: e.productId,
                    image: e.image))
                .toList()
            : null);
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
