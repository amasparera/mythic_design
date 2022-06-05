import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mythic_design/common/exception.dart';

import '../models/product_model.dart';

// class repository utama

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProductDetail();
}

// class implement
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  static const apiKey = "";
  static const baseUrl = "http://10.0.2.2:8080";

  final http.Client client;

  ProductRemoteDataSourceImpl(this.client);

  @override
  Future<List<ProductModel>> getProducts() async {
    print(4);
    final respone = await client.get(Uri.parse("$baseUrl/product/"));
    print(respone.body);

    print(5);
    var body = jsonDecode(respone.body);

    // if (respone.statusCode == 200 && body["data"] != null) {
    return List<ProductModel>.from(
        (body as List<dynamic>).map((x) => ProductModel.fromjson(x)));
    // } else if (body["data"] == null) {
    //   throw DatabaseException(message: body["error"]);
    // } else {
    //   throw ServerException();
    // }
  }

  @override
  Future<ProductModel> getProductDetail() async {
    final respone = await client.get(Uri.parse(""));
    var body = jsonDecode(respone.body);

    if (respone.statusCode == 200 && body["data"] != null) {
      return ProductModel.fromjson(body["data"]);
    } else if (body["data"] != null) {
      throw DatabaseException(message: body["error"]);
    } else {
      throw ServerException();
    }
  }
}
