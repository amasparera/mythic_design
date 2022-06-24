import 'package:flutter/material.dart';
import 'package:mythic_design/common/helper_local.dart';
import 'package:mythic_design/common/requeststate.dart';
import 'package:mythic_design/domain/enities/product.dart';
import 'package:mythic_design/domain/enities/wishlist.dart';
import 'package:mythic_design/domain/user_case/add_wishlist.dart';
import 'package:mythic_design/domain/user_case/delete_wishlist.dart';
import 'package:mythic_design/domain/user_case/get_wishlist.dart';
import 'package:mythic_design/presentation/page/pay.dart';

import '../widget/login_bottom_sheet.dart';

class WishlistNothifier extends ChangeNotifier {
  final GetWislist getWislist;
  final AddWishlist addWishlist;
  final DeleteWishlist deleteWishlist;
  final HelperLocal helperLocal;

  WishlistNothifier(
      this.getWislist, this.helperLocal, this.addWishlist, this.deleteWishlist);

  List<Wishlist> _wishlist = [];
  List<Wishlist> get wishlist => _wishlist;

  final List<Wishlist> _wishlistSelect = [];
  List<Wishlist> get wishlistSelect => _wishlistSelect;

  int get total => _wishlistSelect.isNotEmpty
      ? _wishlistSelect
          .map((e) => int.parse(e.price))
          .reduce((value, element) => value + element)
      : 0;

  bool get all =>
      _wishlist.length == _wishlistSelect.length && wishlist.isNotEmpty;

  List<int> _wishlistInt = [];
  List<int> get wishlistInt => _wishlistInt;

  RequestState _nowState = RequestState.empty;
  RequestState get nowState => _nowState;

  String _message = "";
  String get message => _message;

  void add(BuildContext context, Product product) {
    if (_wishlistInt.contains(int.parse(product.productId))) {
      deleteWishlistTo(context, product);
    } else {
      addWishlistTo(context, product);
    }
  }

  void addSelect(Wishlist wishlist) {
    if (_wishlistSelect.contains(wishlist)) {
      _wishlistSelect.remove(wishlist);
      notifyListeners();
    } else {
      _wishlistSelect.add(wishlist);
      notifyListeners();
    }
  }

  void allSelect() {
    if (_wishlistSelect.length != wishlist.length) {
      _wishlistSelect.clear();
      _wishlistSelect.addAll(_wishlist);
      notifyListeners();
    } else {
      _wishlistSelect.clear();
      notifyListeners();
    }
  }

  void getWishlist() async {
    _nowState = RequestState.loading;
    _wishlistInt.clear();
    _wishlistSelect.clear();
    notifyListeners();
    final data = await helperLocal.loadProfileId();
    if (data != null && data != "") {
      final result = await getWislist.execute(data);
      result.fold((l) {
        _nowState = RequestState.error;
        _message = l.message;
        notifyListeners();
      }, (r) {
        _nowState = RequestState.loaded;
        _wishlist = r;
        _wishlistInt = r.map((e) => int.parse(e.idProduct)).toList();
        notifyListeners();
      });
    }
  }

  Future addWishlistTo(BuildContext context, Product product) async {
    final data = await helperLocal.loadProfileId();
    if (data == null) {
      return showModalBottomSheet(
          context: context,
          builder: (context) => BottomSheet(
              backgroundColor: Colors.white,
              onClosing: () {},
              builder: (context) => const LoginBottomShett()));
    }
    _wishlistInt.add(int.parse(product.productId));

    // add
    final result = await addWishlist.execute(data, product);
    result.fold((l) {
      _message = l.message;
      _wishlistInt.remove(int.parse(product.productId));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(l.message),
      ));
      notifyListeners();
    }, (r) {
      _message = r;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(r),
      ));

      notifyListeners();
    });
  }

  Future deleteWishlistTo(BuildContext context, Product product) async {
    final data = await helperLocal.loadProfileId();
    if (data == null) {
      return showModalBottomSheet(
          context: context,
          builder: (context) => BottomSheet(
              backgroundColor: Colors.white,
              onClosing: () {},
              builder: (context) => const LoginBottomShett()));
    }
    _wishlistInt.remove(int.parse(product.productId));
    notifyListeners();
    // remove
    final result = await deleteWishlist.execute(product.productId);
    result.fold((l) {
      _message = l.message;
      _wishlistInt.add(int.parse(product.productId));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(l.message),
      ));
      notifyListeners();
    }, (r) {
      _message = r;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(r),
      ));

      notifyListeners();
    });
  }

  void checkout(BuildContext context) {
    if (_wishlistSelect.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("select one item"),
      ));
    } else {
      Navigator.pushNamed(context, PayPage.route,arguments: total);
    }
  }
}
