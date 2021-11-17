import 'dart:convert';
import 'dart:io';
import 'package:aluguei/repository/models/authentication/loginResponse.dart';
import 'package:aluguei/repository/models/products/productModel.dart';
import 'package:aluguei/ui/home/product/productData.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import '../appExceptions.dart';
import '../results.dart';

class ProductApi {
  final baseUrl = 'https://aluguei-backend.herokuapp.com/api/products';

  //TODO ajustar os bodys, criar os objetos de retorno e .fromJson de cada um

  Future<Map<String, String>> getHeader() async {
    final box = await Hive.openBox<LoginResponse>('loginResponse');
    final LoginResponse? loginResponseCache = box.getAt(0);
    return {
      'device': 'mobile',
      'Authorization': 'Bearer ${loginResponseCache?.accessToken}',
      "content-type": "application/json"
    };
  }

//todo - fazer notificacao
  // GET - products/available
  Future<List<ProductData>> getAvailableProducts() async {
    List<ProductData> productList = [];

    try {
      var url = Uri.parse('$baseUrl/available');

      final response = await http.get(url, headers: await getHeader());
      verifyResponse(response);

      var productListResponse =
          jsonDecode(response.body.toString())['data'] as List;
      print(productListResponse.toString());

      if (productListResponse.isNotEmpty) {
        print("PRODUTOS: ${productListResponse.toString()}");
        productList = productListResponse
            .map((product) => ProductData.fromJson(product))
            .toList();
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return productList;
  }

  // GET - products/available
  Future<List<ProductData>> searchProduct(searchString) async {
    List<ProductData> productList = [];

    try {
      var url =
          Uri.parse('$baseUrl/available?perPage=10&productName=$searchString');

      //TODO adicionar a query de pesquisa, ver com samuel
      final response = await http.get(url, headers: await getHeader());
      verifyResponse(response);

      var productListResponse =
          jsonDecode(response.body.toString())['data'] as List;
      print(productListResponse.toString());

      if (productListResponse.isNotEmpty) {
        print("PRODUTOS PESQUISA: ${productListResponse.toString()}");
        productList = productListResponse
            .map((product) => ProductData.fromJson(product))
            .toList();
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return productList;
  }

  // GET - products/owned

  Future<List<ProductData>> getMyProducts() async {
    List<ProductData> productList = [];

    try {
      var url = Uri.parse('$baseUrl/owned');
      final response = await http.get(url, headers: await getHeader());
      verifyResponse(response);

      var productListResponse =
          jsonDecode(response.body.toString())['data'] as List;
      print(productListResponse.toString());

      if (productListResponse.isNotEmpty) {
        print("MEUS PRODUTOS: ${productListResponse.toString()}");
        productList = productListResponse
            .map((product) => ProductData.fromJson(product))
            .toList();
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return productList;
  }

  Future<dynamic> getRentedProducts() async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/rented');
      final response = await http.get(url, headers: await getHeader());

      responseJson = verifyResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // POST - products
  Future<dynamic> registerProduct(ProductModel model) async {
    var responseJson;

    try {
      print(
          "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ${jsonEncode(model.toJson())}");
      var url = Uri.parse('$baseUrl');
      final response = await http.post(url,
          body: jsonEncode(model.toJson()), headers: await getHeader());

      print("REGISTRANDO PRODUTO: ${response.body.toString()}");
      responseJson = verifyResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // PUT - products/{productId}
  Future<dynamic> editProduct(int id, ProductModel model) async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/$id');
      final response = await http.put(url,
          body: {
            'name': model.name,
            'description': model.description,
            'category': model.category,
            'price': model.price,
            'timeUnit': model.timeUnit,
            'timeQuantity': model.timeQuantity
          },
          headers: await getHeader());

      responseJson = verifyResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // DELETE - products/{productId}
  Future<dynamic> deleteProduct(int id) async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/$id');
      final response = await http.delete(url, headers: await getHeader());

      responseJson = verifyResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // POST - products/{productId}/rent
  Future<dynamic> rentProduct(int id) async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/${id.toString()}/rent');
      final response = await http.post(url, headers: await getHeader());

      responseJson = verifyResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}
