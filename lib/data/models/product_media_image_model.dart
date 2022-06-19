import 'package:equatable/equatable.dart';

class ProductMediaImageModel extends Equatable {
  final int id;
  
  final String productId;
  final String image;

  const ProductMediaImageModel(
      {required this.id,
    
      required this.productId,
      required this.image});

  factory ProductMediaImageModel.fromjson(Map<String, dynamic> map) {
    return ProductMediaImageModel(
        id: map["idImage"],
       
        productId: map["idProduct"],
        image: map["imageUrl"]);
  }

  @override
  List<Object?> get props => [id, productId, image];
}
