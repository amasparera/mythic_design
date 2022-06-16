import 'dart:convert';

import 'package:mythic_design/common/api_url.dart';
import 'package:mythic_design/common/exception.dart';
import 'package:mythic_design/common/helper_local.dart';
import 'package:mythic_design/data/models/user_model.dart';

import 'package:http/http.dart' as http;

abstract class UserAuthRemote {
  Future<UserModel?> singUp({required Map<String, dynamic> map});
  Future<UserModel?> logIn({required Map<String, dynamic> map});
}

class UserAuthRemoteImpl implements UserAuthRemote {
  final http.Client client;
  final ApiUrl apiUrl;
  final HelperLocal local;

  UserAuthRemoteImpl(
      {required this.local, required this.apiUrl, required this.client});

  @override
  Future<UserModel?> logIn({required Map<String, dynamic> map}) async {
    Uri api = Uri.parse(apiUrl.baseUrl + apiUrl.singUp);
    var json = await client.post(api, body: map);
    var body = jsonDecode(json.body);

    if (json.statusCode == 200) {
      local.saveToken(token: body["accestoken"]);
      return UserModel.fromjson(body["data"]);
    } else {
      print(body["message"]);
      throw ServerException();
    }
  }

  @override
  Future<UserModel> singUp({required Map<String, dynamic> map}) async {
    Uri api = Uri.parse(apiUrl.baseUrl + apiUrl.login);
    var json = await client.post(api, body: map);
    var body = jsonDecode(json.body);

    if (json.statusCode == 200) {
      local.saveToken(token: body["accestoken"]);
      return UserModel.fromjson(body["data"]);
    } else {
      print(body["message"]);
      throw ServerException();
    }
  }
}
