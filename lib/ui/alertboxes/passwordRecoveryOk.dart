import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:flutter/material.dart';


class PasswordRecoveryOk extends StatefulWidget {
  const PasswordRecoveryOk({Key? key}) : super(key: key);

  @override
  _PasswordRecoveryOkState createState() => _PasswordRecoveryOkState();
}

class _PasswordRecoveryOkState extends State<PasswordRecoveryOk> {
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
                                310.0,
                                CustomDimens.verySmallSpacing,
                                CustomDimens.verySmallSpacing,
                                0.0),
                            child: IconButton(
                              splashRadius: 20,
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PasswordRecoveryOk()),
                                );
                              },
                              icon:
                                  Image.asset("assets/images/closeButton.png"),
                              iconSize: CustomDimens.closePopupButton,
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              CustomDimens.smallSpacing,
                              CustomDimens.smallSpacing,
                              CustomDimens.smallSpacing,
                              CustomDimens.smallSpacing),
                          child: Image.asset(
                            "assets/images/likeHand.png",
                            fit: BoxFit.scaleDown,
                            height: CustomDimens.likeSize,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              CustomDimens.smallSpacing,
                              0.0,
                              CustomDimens.smallSpacing,
                              0.0),
                          child: Text(
                            Strings.recoverySuccessful,
                            style: TextStyle(
                                color: CustomColors.primaryColor,
                                fontSize: CustomFontSize.xLargeFontSize),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              CustomDimens.smallSpacing,
                              CustomDimens.largeSpacing,
                              CustomDimens.smallSpacing,
                              CustomDimens.largeSpacing),
                          child: Text(Strings.recoverySuccessfulMessage,
                              style: TextStyle(
                                  color: CustomColors.textGrey,
                                  fontSize: CustomFontSize.mediumFontSize)),
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
