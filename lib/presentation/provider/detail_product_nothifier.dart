import 'package:flutter/cupertino.dart';
import 'package:mythic_design/common/requeststate.dart';
import 'package:mythic_design/domain/enities/product.dart';
import 'package:mythic_design/domain/user_case/get_product_detail.dart';

class ProductDetailNothifier extends ChangeNotifier {
  final GetProductDetail getProductDetail;

  ProductDetailNothifier({required this.getProductDetail});

  RequestState _nowProductDetailState = RequestState.empty;
  RequestState get nowProductDetailState => _nowProductDetailState;

  late Product _product;
  Product get product => _product;

  String _message = "";
  String get message => _message;

  Future<void> fechProductDetail(String productId) async {
    _nowProductDetailState = RequestState.loading;
    notifyListeners();

    final result = await getProductDetail.execute(productId: productId);
    result.fold((l) {
      _message = l.message;
      _nowProductDetailState = RequestState.error;
      notifyListeners();
    }, (r) {
      _product = r;
      _nowProductDetailState = RequestState.loaded;
      notifyListeners();
    });
  }
}
