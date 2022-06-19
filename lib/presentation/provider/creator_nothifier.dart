import 'package:flutter/cupertino.dart';
import 'package:mythic_design/common/helper_local.dart';

class CreatorNothifier extends ChangeNotifier {
  final HelperLocal helperLocal;

  CreatorNothifier(this.helperLocal);

  String _imageProifle = "";
  String get imageProfile => _imageProifle;

  void init() async {
    _imageProifle = await helperLocal.loadProfileImage() ?? "";
    notifyListeners();

  }
}
