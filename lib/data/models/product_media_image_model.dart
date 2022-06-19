import 'package:equatable/equatable.dart';
import 'package:mythic_design/common/api_url.dart';

class ProductMediaImageModel extends Equatable {
  final int id;
  
  final String productId;
  final String image;

  const ProductMediaImageModel(
      {required this.id,
    
      required this.productId,
      required this.image});

  factory ProductMediaImageModel.fromjson(Map<String, dynamic> map,ApiUrl api) {
    return ProductMediaImageModel(
        id: map["idImage"],
       
        productId: map["idProduct"],
        image: "${api.baseUrlImage}/${map["imageUrl"]}");
  }

  @override
  List<Object?> get props => [id, productId, image];
}
