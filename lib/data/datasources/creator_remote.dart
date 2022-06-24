import 'dart:convert';

import 'package:mythic_design/common/api_url.dart';
import 'package:mythic_design/common/exception.dart';
import 'package:mythic_design/data/models/creator_model.dart';
import 'package:http/http.dart' as http;
import 'package:mythic_design/data/models/product_media_image_model.dart';

abstract class CreatorRemoteRepository {
  Future<CreatorModel> getCreator(String id);
  Future<List<ProductMediaImageModel>> getCreatorCollection(String id);
}

class CreatorRemoteRepositoryImpl implements CreatorRemoteRepository {
  final http.Client client;
  final ApiUrl apiUrl;

  CreatorRemoteRepositoryImpl(this.client, this.apiUrl);
  @override
  Future<CreatorModel> getCreator(String id) async {
    Uri api = Uri.parse("${apiUrl.baseUrl}${apiUrl.getCreator}$id");
    final result = await client.get(api);
    var body = jsonDecode(result.body);

    if (result.statusCode == 200) {
      return CreatorModel.fromjson(body["data"], apiUrl);
    } else {
      throw ServerException(message: body["message"]);
    }
  }

  @override
  Future<List<ProductMediaImageModel>> getCreatorCollection(String id) async {
    Uri api = Uri.parse("${apiUrl.baseUrl}${apiUrl.getCreatorCollection}$id");
    final result = await client.get(api);
    var body = jsonDecode(result.body);

    if (result.statusCode == 200) {
      return List<ProductMediaImageModel>.from((body["data"] as List<dynamic>)
          .map((e) => ProductMediaImageModel.fromjson(e, apiUrl)));
    } else {
      throw ServerException(message: body["message"]);
    }
  }
}
