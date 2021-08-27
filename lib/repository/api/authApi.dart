import 'dart:convert';
import 'dart:io';
import 'package:aluguei/repository/models/loginModel.dart';
import 'package:aluguei/repository/models/registerModel.dart';
import 'package:http/http.dart' as http;
import 'appExceptions.dart';

class AuthApi {
  final baseUrl = 'https://aluguei-backend.herokuapp.com';

  Future<dynamic> doLogin(LoginModel model) async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/api/auth/login');
      final response = await http
          .post(url, body: {'email': model.email, 'password': model.password});

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<String> doRegister(RegisterModel model) async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/api/auth/register');
      final response = await http.post(url, body: {
        'email': model.email,
        'firstName': model.firstName,
        'lastName': model.lastName,
        'password': model.password,
        'passwordConfirmation': model.passwordConfirmation,
        'RG': model.RG,
        'CPF': model.CPF,
        'gender': model.gender,
        'phoneOne': model.phoneOne,
        'phoneTwo': model.phoneTwo,
        'CEP': model.CEP,
        'state': model.state,
        'city': model.city,
        'address': model.address,
        'neighborhood': model.neighborhood,
        'number': model.number,
        'complement': model.complement
      });

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
