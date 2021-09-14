import 'package:aluguei/repository/models/authentication/loginModel.dart';
import 'package:aluguei/repository/models/authentication/registerModel.dart';

import 'api/authentication/authApi.dart';

class AuthRepository {
  AuthApi service = AuthApi();

  Future<void> doLogin(LoginModel model) async {
    await service.doLogin(model);
  }

  Future<void> doRegistration(RegisterModel model) async {
    await service.doRegister(model);
  }

  Future<void> requestPasswordReset(String cpf) async {
    await service.requestPasswordReset(cpf);
  }
}