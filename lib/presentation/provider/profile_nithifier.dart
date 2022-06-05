import 'package:flutter/cupertino.dart';
import 'package:mythic_design/common/requeststate.dart';
import 'package:mythic_design/domain/enities/user.dart';
import 'package:mythic_design/domain/user_case/get_user.dart';

class ProfileNothifier extends ChangeNotifier {
  final GetUser getUser;
  ProfileNothifier({required this.getUser});

  RequestState _nowUserState = RequestState.empty;
  RequestState get nowUserState => _nowUserState;

  late User _user;
  User get user => _user;

  String _message = '';
  String get message => _message;

  Future<void> fecthUser() async {
    _nowUserState = RequestState.loading;
    notifyListeners();

    final result = await getUser.execute(id: "1");
    result.fold((l) {
      _message = l.message;
      _nowUserState = RequestState.error;
      notifyListeners();
    }, (r) {
      _user = r;
      _nowUserState = RequestState.loaded;
      notifyListeners();
    });
  }
}
