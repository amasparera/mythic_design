import 'package:shared_preferences/shared_preferences.dart';

class HelperLocal {
  // KEY
  final String keyFavorite = "KEY_FAVORITE";
  final String keyLogin = "KEY_LOGIN";

  // save
  saveFavorite(List<String> listIdFavorite) async {
    final local = await SharedPreferences.getInstance();
    await local.setStringList(keyFavorite, listIdFavorite);
  }

  saveLogin({required bool login}) async {
    final local = await SharedPreferences.getInstance();
    await local.setBool(keyLogin, login);
  }

  // load
  Future<List<String>?> loadFavorite() async {
    final local = await SharedPreferences.getInstance();
    return local.getStringList(keyFavorite);
  }

  Future<bool> loadLogin() async {
    final local = await SharedPreferences.getInstance();
    return local.getBool(keyLogin) ?? false;
  }
}
