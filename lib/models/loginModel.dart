class LoginModel {
  String email;
  String password;

  LoginModel (
      this.email,
      this.password
      );

  @override
  String toString() {
    return 'Login{email: $email, password: $password}' ;
  }
}