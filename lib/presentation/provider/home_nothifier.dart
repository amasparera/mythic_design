import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mythic_design/common/helper_local.dart';
import 'package:mythic_design/common/requeststate.dart';
import 'package:mythic_design/domain/enities/product.dart';
import 'package:mythic_design/domain/user_case/get_products.dart';
import 'package:mythic_design/presentation/page/profile_page.dart';
import 'package:mythic_design/presentation/page/search_page.dart';

import '../widget/login_bottom_sheet.dart';

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

  int page = 0;

  String? profilleImage;

  Future<void> fechProduct() async {
    _nowProductState = RequestState.loading;
    notifyListeners();

    final result = await getProducts.execute(page: page);
    result.fold((l) {
      _nowProductState = RequestState.error;
      _message = l.message;
      notifyListeners();
    }, (r) {
      page = page + 1;
      _nowProductState = RequestState.loaded;
      _listProducts = r;
      notifyListeners();
    });
  }

  Future<void> getProfileImage() async {
    page = 0;
    profilleImage = await helperLocal.loadProfileImage();
  }

  Future<void> getListFavorite() async {
    _listFaforite = await helperLocal.loadFavorite() ?? [];
  }

  void goToProfile(context) {
    if (profilleImage != null) {
      Navigator.pushNamed(context, ProfilePage.routeName);
    } else {
      showModalBottomSheet(
          context: context,
          builder: (context) => BottomSheet(
              backgroundColor: Colors.white,
              onClosing: () {},
              builder: (context) => const LoginBottomShett()));
    }
  }

  void goToSeach(context) {
    Navigator.pushNamed(context, SearchPage.route);
  }
}
