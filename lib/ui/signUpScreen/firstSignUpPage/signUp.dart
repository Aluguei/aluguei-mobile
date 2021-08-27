import 'package:aluguei/ui/loginScreen/login.dart';
import 'package:aluguei/ui/signUpScreen/firstSignUpPage/signUpForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/constants.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

/*TODO
   - Adicinar as outras paginas do cadastro

*/

class _SignUpPageState extends State<SignUpPage> {
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
                          children: <Widget>[const SignUpForm()],
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
                                "assets/images/signUpPageIndicators/signUpPageIndicator01.png",
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(
                                    title: "Login Page",
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
