class RegisterModel {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String passwordConfirmation;
  final String RG;
  final String CPF;
  final String gender;
  final String phoneOne;
  final String phoneTwo;
  final String CEP;
  final String state;
  final String city;
  final String address;
  final String neighborhood;
  final String number;
  final String complement;

  RegisterModel(
      this.email,
      this.firstName,
      this.lastName,
      this.password,
      this.passwordConfirmation,
      this.RG,
      this.CPF,
      this.gender,
      this.phoneOne,
      this.phoneTwo,
      this.CEP,
      this.state,
      this.city,
      this.address,
      this.neighborhood,
      this.number,
      this.complement);

  //TODO terminar o to string
  @override
  String toString() {
    return 'Registration{email: $email, firstName: $firstName, lastName: $lastName}';
  }
}
