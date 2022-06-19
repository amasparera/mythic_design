import 'dart:convert';
import 'dart:developer';

import 'package:mythic_design/common/api_url.dart';
import 'package:mythic_design/common/exception.dart';
import 'package:mythic_design/common/helper_local.dart';
import 'package:mythic_design/data/models/user_model.dart';

import 'package:http/http.dart' as http;

abstract class AuthRemoteRepository {
  Future<UserModel?> singUp({required Map<String, dynamic> map});
  Future<UserModel?> logIn({required Map<String, dynamic> map});
}

class AuthRemoteRepositoryImpl implements AuthRemoteRepository {
  final http.Client client;
  final ApiUrl apiUrl;
  final HelperLocal local;

  AuthRemoteRepositoryImpl(
      {required this.local, required this.apiUrl, required this.client});

  @override
  Future<UserModel?> logIn({required Map<String, dynamic> map}) async {
    Uri api = Uri.parse(apiUrl.baseUrl + apiUrl.login);
    var json = await client.post(api, body: map);
    var body = jsonDecode(json.body);
    log(body.toString());
    if (json.statusCode == 200) {
      local.saveLogin(login: true);
      local.saveToken(token: body["accestoken"]);
      local.saveProfileId(id: body["data"]["id"].toString());
      local.saveProfileImage(image:body["data"]["image"] != "" ? "${apiUrl.baseUrl}/public/${ body["data"]["image"]}" : "");
      return UserModel.fromjson(body["data"]);
    } else {
      throw ServerException(message: body["message"]);
    }
  }

  @override
  Future<UserModel> singUp({required Map<String, dynamic> map}) async {
    Uri api = Uri.parse(apiUrl.baseUrl + apiUrl.singUp);
    var json = await client.post(api, body: map);
    var body = jsonDecode(json.body);
    log(body.toString());

    if (json.statusCode == 200) {
      local.saveLogin(login: true);
      local.saveToken(token: body["accestoken"]);
      local.saveProfileId(id: body["data"]["id"].toString());
      local.saveProfileImage(image:body["data"]["image"] != "" ? "${apiUrl.baseUrl}/public/${ body["data"]["image"]}" : "");
      return UserModel.fromjson(body["data"]);
    } else {
      throw ServerException(message: body["message"]);
    }
  }
}
