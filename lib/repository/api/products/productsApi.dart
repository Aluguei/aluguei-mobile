import 'dart:io';
import 'package:aluguei/repository/models/products/productModel.dart';
import 'package:http/http.dart' as http;
import '../appExceptions.dart';
import '../results.dart';

class ProductApi {
  final baseUrl = 'https://aluguei-backend.herokuapp.com/api/products';
  final Map<String, String>? header = {
    'device': 'mobile',
  };

  //TODO ajustar os bodys depois, o back ainda esta sendo desenvolvido

  // GET - products/available
  Future<dynamic> getAvailableProducts() async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/available');
      final response = await http.get(url, headers: header);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // GET - products/owned
  Future<dynamic> getMyProducts() async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/owned');
      final response = await http.get(url, headers: header);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getRentedProducts() async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/rented');
      final response = await http.get(url, headers: header);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // POST - products
  Future<dynamic> registerProduct(ProductModel model) async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl');
      final response = await http.post(url,
          body: {
            'name': model.name,
            'description': model.description,
            'category': model.category,
            'price': model.price,
            'timeUnit': model.timeUnit,
            'timeQuantity': model.timeQuantity
          },
          headers: header);

      responseJson = returnResponse(response);
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
          headers: header);

      responseJson = returnResponse(response);
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
      final response = await http.delete(url, headers: header);

      responseJson = returnResponse(response);
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
      final response =
          await http.put(url, body: {'productId': id.toString()}, headers: header);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}