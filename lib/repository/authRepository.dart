import 'api/authApi.dart';

class AuthRepository {

  AuthApi service = AuthApi();

  Future<void> doLogin(model) async {
    await service.doLogin(model);
  }

  Future<void> doRegistration(model) async {
    await service.doRegister(model);
  }
}