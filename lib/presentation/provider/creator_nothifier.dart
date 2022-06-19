import 'package:flutter/cupertino.dart';
import 'package:mythic_design/common/helper_local.dart';
import 'package:mythic_design/common/requeststate.dart';
import 'package:mythic_design/domain/enities/creator.dart';
import 'package:mythic_design/domain/user_case/get_creator.dart';

class CreatorNothifier extends ChangeNotifier {
  final HelperLocal helperLocal;
  final GetCreator getCreator;

  CreatorNothifier(this.helperLocal, this.getCreator);

  RequestState _nowCreatorState = RequestState.empty;
  RequestState get nowCreaotrState => _nowCreatorState;

  String _imageProifle = "";
  String get imageProfile => _imageProifle;

  String _message = "";
  String get message => _message;

  late Creator _creator;
  Creator get creator => _creator;

  void init() async {
    _imageProifle = await helperLocal.loadProfileImage() ?? "";
    _nowCreatorState = RequestState.loading;
    notifyListeners();
  }

  Future<void> fechdata(String id) async {
    final result = await getCreator.execute(id);
    result.fold((l) {
      _message = l.message;
      _nowCreatorState = RequestState.error;
      notifyListeners();
    }, (r) {
      _creator = r;
      _nowCreatorState = RequestState.loaded;
      notifyListeners();
    });
  }
}
