import 'dart:convert';
import 'dart:io';
import 'package:aluguei/models/loginModel.dart';
import 'package:http/http.dart' as http;
import 'appExceptions.dart';

class LoginApi {
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
