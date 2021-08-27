import 'package:aluguei/api/authApi.dart';

class AuthRepository {

  AuthApi service = AuthApi();

  Future<bool> doLogin(model) async {
    await service.doLogin(model);
    return true;
  }

  Future<bool> doRegistration(model) async {
    await service.doRegister(model);
    return true;
  }
}