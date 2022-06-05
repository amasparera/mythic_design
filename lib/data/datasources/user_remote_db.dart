import 'dart:convert';

import 'package:mythic_design/common/exception.dart';
import 'package:mythic_design/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<UserModel> getUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  UserRemoteDataSourceImpl({required this.client});

  final String apiKey = "";
  final String baseUrl = "";

  @override
  Future<UserModel> getUser() async {
    final respone = await client.get(Uri.parse(baseUrl));

    var json = jsonDecode(respone.body);

    if (respone.statusCode == 200) {
      return UserModel.fromjson(json["data"]);
    } else {
      throw ServerException();
    }
  }
}
