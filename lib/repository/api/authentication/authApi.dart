import 'dart:io';
import 'package:aluguei/repository/models/authentication/loginModel.dart';
import 'package:aluguei/repository/models/authentication/registerModel.dart';
import 'package:http/http.dart' as http;
import '../appExceptions.dart';
import '../results.dart';

class AuthApi {
  final baseUrl = 'https://aluguei-backend.herokuapp.com/api/auth';

  Future<dynamic> doLogin(LoginModel model) async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/login');
      final response = await http
          .post(url, body: {'email': model.email, 'password': model.password});

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    //TODO salvar em cache a string do token -> accessToken
    print("AAAAAAAAA:     $responseJson" );

    return responseJson;
  }

  Future<String> doRegister(RegisterModel model) async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/register');
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

  Future<dynamic> requestPasswordReset(String cpf) async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/request-forgot-password');
      final response = await http.post(url, body: {'cpf': cpf});

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}