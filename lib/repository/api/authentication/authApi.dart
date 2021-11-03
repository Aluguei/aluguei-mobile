import 'dart:convert';
import 'dart:io';
import 'package:aluguei/repository/models/authentication/loginModel.dart';
import 'package:aluguei/repository/models/authentication/loginResponse.dart';
import 'package:aluguei/repository/models/authentication/registerModel.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import '../appExceptions.dart';
import '../results.dart';

class AuthApi {
  final baseUrl = 'https://aluguei-backend.herokuapp.com/api/auth';

  Future<dynamic> doLogin(LoginModel model) async {
    try {
      var url = Uri.parse('$baseUrl/login');
      final response = await http
          .post(url, body: {'email': model.email, 'password': model.password});

      verifyResponse(response);

      final Map parsed = json.decode(response.body);
      final loginResponse = LoginResponse.fromJson(parsed);

      var box = await Hive.openBox<LoginResponse>('loginResponse');
      return await box.add(loginResponse);

    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> doRegister(RegisterModel model) async {
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

      verifyResponse(response);

      final Map parsed = json.decode(response.body);
      final registerResponse = LoginResponse.fromJson(parsed);

      var box = await Hive.openBox<LoginResponse>('loginResponse');
      return await box.add(registerResponse);

    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> requestPasswordReset(String cpf) async {
    var responseJson;

    try {
      var url = Uri.parse('$baseUrl/request-reset-password');
      final response = await http.post(url, body: {'CPF': cpf});

      responseJson = verifyResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}