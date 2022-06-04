import 'package:flutter/cupertino.dart';
import 'package:mythic_design/common/requeststate.dart';
import 'package:mythic_design/domain/enities/product.dart';
import 'package:mythic_design/domain/user_case/product_usecase.dart';

class HomeNotifier extends ChangeNotifier {
  final GetProducts getProducts;

  HomeNotifier({required this.getProducts});

  RequestState _nowProductState = RequestState.empty;
  RequestState get nowPlayingState => _nowProductState;

  List<Product> _listProducts = [];
  List<Product> get listProducts => _listProducts;

  List<String> _listFaforite = [];
  List<String> get listFavorite => _listFaforite;
  

  String _message = ' ';
  String get message => _message;

  Future<void> fechProduct() async {
    _nowProductState = RequestState.loading;
    notifyListeners();

    final result = await getProducts.execute();
    result.fold((l) {
      _nowProductState = RequestState.error;
      _message = l.message;
      notifyListeners();
    }, (r) {
      _nowProductState = RequestState.loaded;
      _listProducts = r;
      notifyListeners();
    });
  }
}
