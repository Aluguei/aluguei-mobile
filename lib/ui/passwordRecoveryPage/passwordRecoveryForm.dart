import 'package:aluguei/Repository/authRepository.dart';
import 'package:aluguei/repository/api/appExceptions.dart';
import 'package:aluguei/ui/Alertboxes/passwordRecoveryOk.dart';
import 'package:aluguei/ui/errors/errorsMessages.dart';
import 'package:aluguei/ui/home/home.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class PasswordRecoveryForm extends StatefulWidget {
  const PasswordRecoveryForm({Key? key}) : super(key: key);

  @override
  PasswordRecoveryFormState createState() {
    return PasswordRecoveryFormState();
  }
}

class PasswordRecoveryFormState extends State<PasswordRecoveryForm> {
  final _formKey = GlobalKey<FormState>();
  var cpf = "";
  final AuthRepository authRepository = AuthRepository();

  Future<void> doRecovery(String cpf) async {
    try {
      await authRepository.requestPasswordReset(cpf);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return PasswordRecoveryOk();
          });
    } on FetchDataException catch (e) {
      print(e.toString());
      ErrorsMessages.showGenericErrorMessage(context);
    } catch (e) {
      print(e.toString());
      ErrorsMessages.showResetPasswordErrorMessage(context);
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
            child: Text(Strings.forgotPasswordText,
                style: TextStyle(
                    color: CustomColors.textGrey,
                    fontSize: CustomFontSize.xLargeFontSize)),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(
                  CustomDimens.smallSpacing,
                  CustomDimens.mediumSpacing,
                  CustomDimens.smallSpacing,
                  CustomDimens.mediumSpacing),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                autofocus: true,
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
                  cpf = value;
                  return null;
                },
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing, 0.0,
                  CustomDimens.smallSpacing, CustomDimens.mediumSpacing),
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
                      doRecovery(cpf);
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
