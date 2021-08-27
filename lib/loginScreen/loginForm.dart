import 'package:aluguei/Repository/authRepository.dart';
import 'package:aluguei/home/home.dart';
import 'package:aluguei/signUpScreen/firstSignUpPage/signUp.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/models/loginModel.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:flutter/rendering.dart';
import 'package:email_validator/email_validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final model = LoginModel("", "");
  final AuthRepository authRepository = AuthRepository();

  doLogin() async {
    try {
      await authRepository.doLogin(model);
      openHomeScreen();
    } catch (e) {
      //TODO tratar retornos dos erros e apresentar ao usuario
      print(e);
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
              padding: const EdgeInsets.fromLTRB(
                  CustomDimens.smallSpacing,
                  CustomDimens.mediumSpacing,
                  CustomDimens.smallSpacing,
                  CustomDimens.mediumSpacing),
              child: TextFormField(
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
                  CustomDimens.smallSpacing, 0.0),
              child: Container(
                  width: double.infinity,
                  height: CustomDimens.buttonHeight,
                  child: OutlinedButton(
                    child: Text(
                      Strings.loginButtonText,
                      style: TextStyle(
                          color: CustomColors.white,
                          fontSize: CustomFontSize.smallOutlinedButton),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(model.toString());
                        //TODO  apresentar loading
                        //TODO tratar erros
                        Future.delayed(Duration.zero, () {
                          doLogin();
                        });
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
          Padding(
              padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing, 0.0,
                  CustomDimens.smallSpacing, CustomDimens.mediumSpacing),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          0.0, 0.0, CustomDimens.smallSpacing, 0.0),
                      child: Container(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage(
                                        title: "SignUp Page 1",
                                      )),
                            );
                          },
                          child: Text(
                            Strings.signupButtonText,
                            style: TextStyle(
                              fontSize: CustomFontSize.smallFontSize,
                              color: CustomColors.textGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          CustomDimens.smallSpacing, 0.0, 0.0, 0.0),
                      child: Container(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            Strings.forgotPasswordButtonText,
                            style: TextStyle(
                              fontSize: CustomFontSize.smallFontSize,
                              color: CustomColors.textGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]))
        ],
      ),
    );
  }
}
