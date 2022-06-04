import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mythic_design/common/exception.dart';

import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  static const apiKey = "";
  static const baseUrl = "localhost";

  final http.Client client;

  ProductRemoteDataSourceImpl(this.client);

  @override
  Future<List<ProductModel>> getProducts() async {
    final respone = await client.get(Uri.parse("$baseUrl/products"));
    var body = jsonDecode(respone.body);

    if (respone.statusCode == 200) {
      return List<ProductModel>.from(
          (body["data"] as List).map((x) => ProductModel.fromjson(x)));
    } else {
      throw ServerException();
    }
  }
}

