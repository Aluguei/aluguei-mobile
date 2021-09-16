import 'package:aluguei/ui/loginScreen/login.dart';
import 'package:aluguei/ui/passwordRecoveryPage/passwordRecoveryForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/constants.dart';

class passwordRecovery extends StatefulWidget {
  passwordRecovery({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _passwordRecoveryState createState() => _passwordRecoveryState();
}

class _passwordRecoveryState extends State<passwordRecovery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.greyBackgroundColor,
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                color: CustomColors.primaryColor,
              )
            ],
          ),
          Padding(
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                CustomDimens.smallSpacing,
                                CustomDimens.smallSpacing,
                                CustomDimens.smallSpacing,
                                0.0),
                            child: Image.asset(
                              'assets/images/logo_aluguei.png',
                              height: CustomDimens.logoSize,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const PasswordRecoveryForm()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(
                      CustomDimens.mediumSpacing,
                      CustomDimens.largeSpacing,
                      CustomDimens.smallSpacing,
                      0.0),
                  child: IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => passwordRecovery(
                              title: "Close Password Recovery Page",
                            )),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage(
                              title: "Open LoginPage",
                            )),
                      );
                    },
                    icon: Image.asset("assets/images/backArrow.png"),
                    iconSize: 31,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
