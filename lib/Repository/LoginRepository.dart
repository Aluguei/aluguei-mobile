import 'package:aluguei/api/loginApi.dart';

class LoginRepository {

  LoginApi service = LoginApi();

  Future<bool> doLogin(model) async {
    await service.doLogin(model);
    return true;
  }
}