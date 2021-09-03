import 'package:aluguei/ui/signUpScreen/fourthSignUpPage/signUpForm4.dart';
import 'package:aluguei/ui/signUpScreen/thirdSignUpPage/signUp3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/constants.dart';

class SignUpPage4 extends StatefulWidget {
  SignUpPage4({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPage4State createState() => _SignUpPage4State();
}

class _SignUpPage4State extends State<SignUpPage4> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing, 0.0,
                  CustomDimens.smallSpacing, 0.0),
              child: Container(
                alignment: Alignment.center,
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
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
                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[const SignUpForm4()],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            CustomDimens.smallSpacing,
                            CustomDimens.smallSpacing,
                            CustomDimens.smallSpacing,
                            0.0),
                        child: Container(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  CustomDimens.smallSpacing,
                                  CustomDimens.smallSpacing,
                                  CustomDimens.smallSpacing,
                                  CustomDimens.smallSpacing),
                              child: Image.asset(
                                "assets/images/signUpPageIndicators/signUpPageIndicator04.png",
                                height: 20,
                              ),
                            )),
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
                              builder: (context) => SignUpPage4(
                                title: "SignUp Page 4",
                              )),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage3(
                                    title: "SignUp Page 3",
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
      ),
    );
  }
}
