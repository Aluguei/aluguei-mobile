import 'package:aluguei/models/loginModel.dart';
import 'package:http/http.dart' as http;

class LoginService {
  final baseUrl = 'https://aluguei-backend.herokuapp.com';

  Future<String> doLogin(LoginModel model) async {
    var url = Uri.parse('$baseUrl/api/auth/login');
    var response = await http
        .post(url, body: {'email': model.email, 'password': model.password});

    if (response.statusCode == 201) {
      return 'Success';
    } else {
      final error = response.body;
      throw Exception('Failed to login: $error');
    }
  }
}
