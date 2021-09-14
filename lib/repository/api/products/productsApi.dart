import 'dart:io';
import 'package:aluguei/repository/models/products/productModel.dart';
import 'package:http/http.dart' as http;
import '../appExceptions.dart';
import '../results.dart';

class ProductApi {
  final baseUrl = 'https://aluguei-backend.herokuapp.com';

  Future<dynamic> getAvailableProducts() async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/products/available');
      final response = await http.get(url);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getMyProducts() async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/products/my');
      final response = await http.get(url);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getRentedProducts() async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/products/rented');
      final response = await http.get(url);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> registerProduct(ProductModel model) async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/products');
      final response = await http.post(url, body: {
        'name': model.name,
        'description': model.description,
        'category': model.category,
        'price': model.price,
        'timeUnit': model.timeUnit,
        'timeQuantity': model.timeQuantity
      });

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> editProduct(int id, ProductModel model) async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/products/$id');
      final response = await http.put(url, body: {
        'name': model.name,
        'description': model.description,
        'category': model.category,
        'price': model.price,
        'timeUnit': model.timeUnit,
        'timeQuantity': model.timeQuantity
      });

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> deleteProduct(int id) async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/products/$id');
      final response = await http.delete(url);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> rentProduct(int id) async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/products/$id/rent');
      final response = await http.put(url, body: {'productId': id});

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}
