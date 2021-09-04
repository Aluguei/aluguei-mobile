import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:flutter/material.dart';

class passwordRecoveryOk extends StatefulWidget {
  const passwordRecoveryOk({Key? key}) : super(key: key);

  @override
  _passwordRecoveryOkState createState() => _passwordRecoveryOkState();
}

class _passwordRecoveryOkState extends State<passwordRecoveryOk> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  //TODO TERMINAR DE AJEITAR O POPUP E O NAVIGATOR DELE

  contentBox(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          CustomDimens.smallSpacing, 0.0, CustomDimens.smallSpacing, 0.0),
      child: Container(
        alignment: Alignment.center,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              CustomDimens.smallSpacing,
                              CustomDimens.smallSpacing,
                              CustomDimens.smallSpacing,
                              0.0),
                          child: Image.asset(
                            "assets/images/likeHand.png",
                            height: CustomDimens.logoSize,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              CustomDimens.smallSpacing,
                              0.0,
                              CustomDimens.smallSpacing,
                              0.0),
                          child: Text(Strings.recoverySuccessful,
                              style: TextStyle(
                                  color: CustomColors.primaryColor,
                                  fontSize: CustomFontSize.largeFontSize)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
