import 'package:flutter/material.dart';
import 'package:mythic_design/common/helper_local.dart';
import 'package:mythic_design/common/notif_local.dart';
import 'package:mythic_design/common/requeststate.dart';
import 'package:mythic_design/domain/enities/notifikasi.dart';
import 'package:mythic_design/domain/enities/product.dart';
import 'package:mythic_design/domain/user_case/get_products.dart';
import 'package:mythic_design/presentation/page/notifikasi_page.dart';
import 'package:mythic_design/presentation/page/profile_page.dart';
import 'package:mythic_design/presentation/page/search_page.dart';
import 'package:mythic_design/presentation/provider/nitifikasi_nothifier.dart';
import 'package:provider/provider.dart';

import '../widget/login_bottom_sheet.dart';

class HomeNotifier extends ChangeNotifier {
  final GetProducts getProducts;
  final HelperLocal helperLocal;

  HomeNotifier(this.getProducts, this.helperLocal);

  RequestState _nowProductState = RequestState.empty;
  RequestState get nowPlayingState => _nowProductState;

  RequestState _nowProductStateLoad = RequestState.empty;
  RequestState get nowPlayingStateLoad => _nowProductStateLoad;

  ScrollController homeListProduct = ScrollController();

  int get statusStateLoad {
    if (_nowProductStateLoad == RequestState.empty) {
      return 1;
    }
    return 2;
  }

  List<Product> _listProducts = [];
  List<Product> get listProducts => _listProducts;

  List<String> _listFaforite = [];
  List<String> get listFavorite => _listFaforite;

  String _message = '';
  String get message => _message;

  int page = 0;

  String? profilleImage;

  final service = NothifLocal();

  Future<void> fechProductLoad(BuildContext context) async {
    final result = await getProducts.execute(page: page);
    await Future.delayed(const Duration(seconds: 3));
    result.fold((l) {
      _nowProductStateLoad = RequestState.loaded;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(l.message),
      ));
      notifyListeners();
    }, (r) {
      _nowProductStateLoad = RequestState.empty;
      _listProducts.addAll(r);
      notifyListeners();
    });
  }

  Future<void> fechProduct() async {
    _nowProductState = RequestState.loading;
    notifyListeners();
    final result = await getProducts.execute(page: page);
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

  Future<void> getlogin() async {
    profilleImage = null;
    page = 0;
    var isLogin = await helperLocal.loadLogin();
    if (isLogin) {
      profilleImage = await helperLocal.loadProfileImage();
      notifyListeners();
    }
  }

  Future<void> getListFavorite() async {
    _listFaforite = await helperLocal.loadFavorite() ?? [];
  }

  void goToProfile(context) async {
    bool login = await helperLocal.loadLogin();
    if (login) {
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

  void shownothif(BuildContext context) async {
    helperLocal.loadInstal().then((value) {
      if (value == false) {
        Future.delayed(const Duration(seconds: 5), () {
          context
              .read<NotifikasiNothifier>()
              .addNothif(_install..time = DateTime.now());
          helperLocal.saveInstal(instal: true);
          service.showNotif(
              id: _install.id,
              body: _install.body,
              title: _install.title,
              payload: NotifikasiPage.route);
          notifyListeners();
        });
      }
    });
  }

  void clearData() {
    helperLocal.clear();
  }

  void init(context) {
    _nowProductStateLoad = RequestState.empty;
    service.init();
    service.onNothif.listen((value) async {
      if (value != null) {
        service.onNothif.value = null;
        Navigator.pushNamed(context, value);
      }
    });

    homeListProduct.addListener(() async {
      if (homeListProduct.position.maxScrollExtent == homeListProduct.offset) {
        _nowProductStateLoad = RequestState.loading;
        notifyListeners();
        page = page + 1;
        await fechProductLoad(context);
      }
    });
  }

  final NothifApp _install = NothifApp(
    title: "Developer : Amas Parera",
    body:
        "Terimakasih telah menguji coba aplikasi saya, mohon maaf sebagain fitur masih di kerjakan di bagian server.\nSegala masukan bisa dikirimkan ke developer terimakasih.",
    id: 0,
  );

  @override
  void dispose() {
    homeListProduct.dispose();
    service.onNothif.close();
    super.dispose();
  }
}
