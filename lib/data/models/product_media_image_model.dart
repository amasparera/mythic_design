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
        id: map["Id"],
        creatorId: map["CreatorId"],
        productId: map["ProductId"],
        image: map["Image"]);
  }

  @override
  List<Object?> get props => [id, creatorId, productId, image];
}
