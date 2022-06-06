import 'package:flutter/cupertino.dart';
import 'package:mythic_design/common/helper_local.dart';
import 'package:mythic_design/common/requeststate.dart';
import 'package:mythic_design/domain/enities/product.dart';
import 'package:mythic_design/domain/user_case/get_products.dart';
import 'package:mythic_design/presentation/page/profile_page.dart';

class HomeNotifier extends ChangeNotifier {
  final GetProducts getProducts;
  final HelperLocal helperLocal;

  HomeNotifier({required this.getProducts, required this.helperLocal});

  RequestState _nowProductState = RequestState.empty;
  RequestState get nowPlayingState => _nowProductState;

  List<Product> _listProducts = [];
  List<Product> get listProducts => _listProducts;

  List<String> _listFaforite = [];
  List<String> get listFavorite => _listFaforite;

  String _message = ' ';
  String get message => _message;

  late bool isLogin;

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

  Future<void> getLogin() async {
    isLogin = await helperLocal.loadLogin();
  }

  Future<void> getListFavorite() async {
    _listFaforite = await helperLocal.loadFavorite() ?? [];
  }

  void goToProfile(context) {
    // if (isLogin == true) {
      Navigator.pushNamed(context, ProfilePage.routeName);
    // } else {
    //   if (kDebugMode) {
    //     print("belum login");
    //   }
    // }
  }
}
