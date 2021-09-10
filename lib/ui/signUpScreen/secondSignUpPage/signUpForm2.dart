import 'package:aluguei/repository/models/registerModel.dart';
import 'package:aluguei/ui/signUpScreen/secondSignUpPage/signUp2.dart';
import 'package:aluguei/ui/signUpScreen/thirdSignUpPage/signUp3.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:flutter/rendering.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUpForm2 extends StatefulWidget {
  SignUpForm2({Key? key, required this.model}) : super(key: key);

  final RegisterModel model;

  @override
  SignUpForm2State createState() {
    return SignUpForm2State(model);
  }
}

class SignUpForm2State extends State<SignUpForm2> {
  SignUpForm2State(this.model);

  final RegisterModel model;
  final _formKey = GlobalKey<FormState>();

  String dropdownValue = Strings.fieldDropDownChose;

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
                  model.firstName = value;
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
                model.lastName = value;
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
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.fieldRGNull;
                  }
                  model.RG = value;
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
                      !GetUtils.isCpf(value) ||
                      !GetUtils.isCnpj(value)) {
                    return Strings.fieldCPFNull;
                  }
                  model.CPF = value;
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
                  if (value == null ||
                      value.isEmpty ||
                      value == 'Escolha um(a)') {
                    return Strings.fieldDropdownInvalidOption;
                  } else {
                    if (value == 'Feminino') {
                      model.gender = 'female';
                    } else if (value == 'Masculino') {
                      model.gender = 'male';
                    } else {
                      model.gender = 'other';
                    }
                  }
                },
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: Strings.fieldGenderDropDownList
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

                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage2(
                                    title: "Close SignUpPage2",
                                    model: model,
                                  )));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage3(
                                    title: "Open SignUpPage3",
                                    model: model,
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
