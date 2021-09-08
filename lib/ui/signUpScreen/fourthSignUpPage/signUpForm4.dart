import 'package:aluguei/repository/api/appExceptions.dart';
import 'package:aluguei/repository/authRepository.dart';
import 'package:aluguei/repository/models/registerModel.dart';
import 'package:aluguei/ui/errors/errorsMessages.dart';
import 'package:aluguei/ui/home/home.dart';
import 'package:aluguei/ui/loadings/loadingOverlay.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:flutter/rendering.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

class SignUpForm4 extends StatefulWidget {
  const SignUpForm4({Key? key, required this.model}) : super(key: key);

  final RegisterModel model;

  @override
  SignUpForm4State createState() {
    return SignUpForm4State(model);
  }
}

class SignUpForm4State extends State<SignUpForm4> {
  SignUpForm4State(this.model);

  final RegisterModel model;

  final _formKey = GlobalKey<FormState>();

  //TODO ajustar o inicializar de model ou algo do tipo depois,o model deve ser preenchido durante o fluxo todo de cadastro

  String dropdownValue2 = Strings.fieldDropDownChose;
  String dropdownValue3 = Strings.fieldDropDownChose;

  final AuthRepository authRepository = AuthRepository();

  Future<void> doRegistration(model) async {
    try {
      await authRepository.doRegistration(model);
      openHomeScreen();
    } on FetchDataException catch (e) {
      print(e.toString());
      ErrorsMessages.showGenericErrorMessage(context);
    } catch (e) {
      print(e.toString());
      ErrorsMessages.showRegistrationErrorMessage(context);
    }
  }

  openHomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HomePage(
                title: 'Home Page',
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing,
                CustomDimens.smallSpacing, CustomDimens.smallSpacing, 0.0),
            child: Image.asset(
              "assets/images/logo_aluguei.png",
              height: CustomDimens.logoSize,
              fit: BoxFit.scaleDown,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing,
                CustomDimens.smallSpacing, CustomDimens.smallSpacing, 0.0),
            child: Text(Strings.registrationText,
                style: TextStyle(
                    color: CustomColors.textGrey,
                    fontSize: CustomFontSize.largeFontSize)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing,
                CustomDimens.smallSpacing, CustomDimens.smallSpacing, 0.0),
            child: Container(
              width: double.infinity,
              child: Text(Strings.registrationAddressDataText,
                  style: TextStyle(
                      color: CustomColors.textGrey,
                      fontSize: CustomFontSize.smallFontSize)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(
                  CustomDimens.smallSpacing,
                  CustomDimens.verySmallSpacing,
                  CustomDimens.smallSpacing,
                  CustomDimens.mediumSpacing),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                autofocus: true,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter()
                ],
                style: TextStyle(
                    fontSize: CustomDimens.fieldFontSize,
                    color: CustomColors.textGrey,
                    height: CustomDimens.fieldHeight),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: CustomColors.fieldBorderColor)),
                    labelText: Strings.fieldCEPTitle,
                    labelStyle: TextStyle(color: CustomColors.textGrey),
                    fillColor: CustomColors.greyBackgroundColor,
                    filled: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.fieldCEPNull;
                  }

                  model.CEP = value;
                  return null;
                },
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(
                  CustomDimens.smallSpacing,
                  CustomDimens.verySmallSpacing,
                  CustomDimens.smallSpacing,
                  CustomDimens.mediumSpacing),
              child: DropdownButtonFormField<String>(
                value: dropdownValue2,
                icon: const Icon(Icons.arrow_downward),
                style: TextStyle(
                    fontSize: CustomDimens.fieldFontSize,
                    color: CustomColors.textGrey,
                    height: CustomDimens.fieldHeight),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: CustomColors.fieldBorderColor)),
                    labelText: Strings.fieldEstateTitle,
                    labelStyle: TextStyle(color: CustomColors.textGrey),
                    fillColor: CustomColors.greyBackgroundColor,
                    filled: true),
                iconSize: 24,
                elevation: 16,

                validator: (value) {
                  if (value == null || value.isEmpty || value == 'Escolha um(a)') {

                    return Strings.fieldDropdownInvalidOption;
                  }
                  model.state= value;
                  return null;
                },
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue2 = newValue!;
                  });
                },

                items: Strings.fieldStateDropDownList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(
                  CustomDimens.smallSpacing,
                  CustomDimens.verySmallSpacing,
                  CustomDimens.smallSpacing,
                  CustomDimens.mediumSpacing),
              child: DropdownButtonFormField<String>(
                value: dropdownValue3,
                icon: const Icon(Icons.arrow_downward),
                style: TextStyle(
                    fontSize: CustomDimens.fieldFontSize,
                    color: CustomColors.textGrey,
                    height: CustomDimens.fieldHeight),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: CustomColors.fieldBorderColor)),
                    labelText: Strings.fieldCityTitle,
                    labelStyle: TextStyle(color: CustomColors.textGrey),
                    fillColor: CustomColors.greyBackgroundColor,
                    filled: true),
                iconSize: 24,
                elevation: 16,
                validator: (value) {
                  if (value == null || value.isEmpty || value == 'Escolha um(a)') {
                    return Strings.fieldDropdownInvalidOption;
                  }
                  model.state= value;
                  return null;
                },
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue3 = newValue!;
                  });
                },
                items: Strings.fieldCityDropDownList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing, 0.0,
                  CustomDimens.smallSpacing, CustomDimens.smallSpacing),
              child: Container(
                  width: double.infinity,
                  height: CustomDimens.buttonHeight,
                  child: OutlinedButton(
                    child: Text(
                      Strings.advanceText,
                      style: TextStyle(
                          color: CustomColors.white,
                          fontSize: CustomFontSize.smallOutlinedButton),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final loading = LoadingOverlay.of(context);
                        //TODO ajustar quando os campos faltantes estiverem ok
                        model.CEP = "23892-160";
                        model.address =
                            "Rua Ademar Vieira 10 Quadra 45 Lote 179";
                        model.city = "Aiquara";
                        model.state = "BA";
                        model.neighborhood = "test";
                        model.number = "000";
                        model.complement = "casa teste";
                        model.gender =
                            "female"; //TODO verificar com o samuel, mas parece que deve mandar em ingles
                        loading.during(doRegistration(model));
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) {
                          if (states.contains(MaterialState.pressed)) {
                            return CustomColors.darkPrimaryColor;
                          }
                          return CustomColors.primaryColor;
                        },
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ))),
        ],
      ),
    );
  }
}
