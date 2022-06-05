import 'package:equatable/equatable.dart';

class ProductMediaImageModel extends Equatable {
  final String id;
  final String creatorId;
  final String productId;
  final String image;

  const ProductMediaImageModel(
      {required this.id,
      required this.creatorId,
      required this.productId,
      required this.image});

  factory ProductMediaImageModel.fromjson(Map<String, dynamic> map) {
    return ProductMediaImageModel(
        id: map["id"],
        creatorId: map["creator"],
        productId: map["productId"],
        image: map["productImage"]);
  }

  @override
  List<Object?> get props => [id, creatorId, productId, image];
}
