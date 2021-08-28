import 'package:aluguei/ui/signUpScreen/thirdSignUpPage/signUp3.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:flutter/rendering.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

class SignUpForm2 extends StatefulWidget {
  const SignUpForm2({Key? key}) : super(key: key);

  @override
  SignUpForm2State createState() {
    return SignUpForm2State();
  }
}

class SignUpForm2State extends State<SignUpForm2> {
  final _formKey = GlobalKey<FormState>();

  String dropdownValue = Strings.fieldGenderDropDownChose;

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
              child: Text(Strings.registrationPersonalDataText,
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
                style: TextStyle(
                    fontSize: CustomDimens.fieldFontSize,
                    color: CustomColors.textGrey,
                    height: CustomDimens.fieldHeight),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: CustomColors.fieldBorderColor)),
                    labelText: Strings.fieldFirstNameTitle,
                    labelStyle: TextStyle(color: CustomColors.textGrey),
                    fillColor: CustomColors.greyBackgroundColor,
                    filled: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.fieldFirstNameNull;
                  }
                  return null;
                },
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing, 0.0,
                CustomDimens.smallSpacing, CustomDimens.mediumSpacing),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontSize: CustomDimens.fieldFontSize,
                color: CustomColors.textGrey,
                height: CustomDimens.fieldHeight,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.fieldBorderColor),
                ),
                labelText: Strings.fieldLastNameTitle,
                labelStyle: TextStyle(color: CustomColors.textGrey),
                fillColor: CustomColors.greyBackgroundColor,
                filled: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return Strings.fieldLastNameNull;
                }
                return null;
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing, 0.0,
                  CustomDimens.smallSpacing, CustomDimens.mediumSpacing),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: TextStyle(
                    fontSize: CustomDimens.fieldFontSize,
                    color: CustomColors.textGrey,
                    height: CustomDimens.fieldHeight),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: CustomColors.fieldBorderColor)),
                    labelText: Strings.fieldRGTitle,
                    labelStyle: TextStyle(color: CustomColors.textGrey),
                    fillColor: CustomColors.greyBackgroundColor,
                    filled: true),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.fieldRGNull;
                  }
                  return null;
                },
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(
                  CustomDimens.smallSpacing,
                  CustomDimens.verySmallSpacing,
                  CustomDimens.smallSpacing,
                  CustomDimens.mediumSpacing),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: TextStyle(
                    fontSize: CustomDimens.fieldFontSize,
                    color: CustomColors.textGrey,
                    height: CustomDimens.fieldHeight),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter()
                ],
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: CustomColors.fieldBorderColor)),
                    labelText: Strings.fieldCPFTitle,
                    labelStyle: TextStyle(color: CustomColors.textGrey),
                    fillColor: CustomColors.greyBackgroundColor,
                    filled: true),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      UtilBrasilFields.isCPFValido(value) ||
                      UtilBrasilFields.isCNPJValido(value)) {
                    return Strings.fieldCPFNull;
                  }
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
                value: dropdownValue,
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
                    labelText: Strings.fieldGenderTitle,
                    labelStyle: TextStyle(color: CustomColors.textGrey),
                    fillColor: CustomColors.greyBackgroundColor,
                    filled: true),
                iconSize: 24,
                elevation: 16,
                validator: (value) {
                  if (value == null || value.isEmpty || value == 'Escolha um') {
                    return Strings.fieldGenderNull;
                  }
                },
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Escolha um', 'Masculino', 'Feminino', 'Outro']
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage3(
                                    title: "Sign Up Page3",
                                  )));
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
