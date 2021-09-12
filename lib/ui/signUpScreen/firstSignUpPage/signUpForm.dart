import 'package:aluguei/repository/models/registerModel.dart';
import 'package:aluguei/ui/loginScreen/login.dart';
import 'package:aluguei/ui/signUpScreen/secondSignUpPage/signUp2.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:flutter/rendering.dart';
import 'package:email_validator/email_validator.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  var confirmPass;
  final model = RegisterModel(
      "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(
                CustomDimens.smallSpacing,
                CustomDimens.smallSpacing,
                CustomDimens.smallSpacing,
                0.0),
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
                    fontSize: CustomFontSize.VeryLargeFontSize)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing,
                CustomDimens.smallSpacing, CustomDimens.smallSpacing, 0.0),
            child: Container(
              width: double.infinity,
              child: Text(Strings.registrationAccessDataText,
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
                    labelText: Strings.fieldEmailTitle,
                    labelStyle: TextStyle(color: CustomColors.textGrey),
                    fillColor: CustomColors.greyBackgroundColor,
                    filled: true),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !EmailValidator.validate(value)) {
                    return Strings.fieldEmailNull;
                  }
                  model.email = value;
                  return null;
                },
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing, 0.0,
                CustomDimens.smallSpacing, CustomDimens.mediumSpacing),
            child: TextFormField(
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
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
                labelText: Strings.fieldPasswordTitle,
                labelStyle: TextStyle(color: CustomColors.textGrey),
                fillColor: CustomColors.greyBackgroundColor,
                filled: true,
              ),
              validator: (value) {
                confirmPass = value;
                if (value == null || value.isEmpty) {
                  return Strings.fieldPasswordNull;
                }
                model.password = value;
                return null;
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing, 0.0,
                  CustomDimens.smallSpacing, CustomDimens.mediumSpacing),
              child: TextFormField(
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
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
                    labelText: Strings.confirmPasswordText,
                    labelStyle: TextStyle(color: CustomColors.textGrey),
                    fillColor: CustomColors.greyBackgroundColor,
                    filled: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.fieldPasswordNull;
                  }
                  if (value != confirmPass) {
                    return Strings.forgotPasswordDifference;
                  }

                  model.passwordConfirmation = value;
                  return null;
                },
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
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(
                                    title: "Close LoginPage",
                                  )),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage2(
                                    title: "Go to SignUpPage 2",
                                    model: model,
                                  )),
                        );
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
