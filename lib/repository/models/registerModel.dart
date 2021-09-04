class RegisterModel {
  String email;
  String firstName;
  String lastName;
  String password;
  String passwordConfirmation;
  String RG;
  String CPF;
  String gender; // ENUM [ female, other, male ]
  String phoneOne;
  String phoneTwo;
  String CEP;
  String state;
  String city;
  String address;
  String neighborhood;
  String number;
  String complement;

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

  @override
  String toString() {
    return 'Registration{email: $email, firstName: $firstName, '
        'lastName: $lastName, password: $password, '
        'passwordConfirmation: $passwordConfirmation, '
        'RG:$RG, CPF: $CPF, gender: $gender, phoneOne: $phoneOne,'
        'phoneTwo: $phoneTwo, CEP: $CEP, state: $state, city: $city, '
        'address: $address, neighborhood: $neighborhood, number: $number, '
        'complement: $complement}';
  }
}
