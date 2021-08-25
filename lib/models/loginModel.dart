class LoginModel {
  final String email;
  final String password;

  LoginModel (
      this.email,
      this.password
      );

  @override
  String toString() {
    return 'Login{email: $email, password: $password}' ;
  }
}