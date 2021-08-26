import 'package:aluguei/models/registerModel.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  final baseUrl = 'https://aluguei-backend.herokuapp.com';

  Future<String> doLogin(RegisterModel model) async {
    var url = Uri.parse('$baseUrl/api/auth/register');
    var response = await http.post(url, body: {
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

    if (response.statusCode == 201) {
      return 'Success';
    } else {
      final error = response.body;
      throw Exception('Failed to register: $error');
    }
  }
}
