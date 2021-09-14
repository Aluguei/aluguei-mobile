import 'package:aluguei/repository/models/authentication/registerModel.dart';
import 'package:aluguei/ui/signUpScreen/fourthSignUpPage/signUpForm4.dart';
import 'package:aluguei/ui/signUpScreen/thirdSignUpPage/signUp3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/constants.dart';

class SignUpPage4 extends StatefulWidget {
  SignUpPage4({Key? key, required this.title, required this.model}) : super(key: key);

  final String title;
  final RegisterModel model;

  @override
  _SignUpPage4State createState() => _SignUpPage4State(model);
}

class _SignUpPage4State extends State<SignUpPage4> {
  _SignUpPage4State(this.model);
  final RegisterModel model;

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

                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[SignUpForm4(model: model,)],
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
                                model: model,
                              )),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage3(
                                    title: "SignUp Page 3",
                                    model: model,
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
