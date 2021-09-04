import 'package:aluguei/repository/models/registerModel.dart';
import 'package:aluguei/ui/signUpScreen/firstSignUpPage/signUp.dart';
import 'package:aluguei/ui/signUpScreen/secondSignUpPage/signUpForm2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/constants.dart';

class SignUpPage2 extends StatefulWidget {
  SignUpPage2({Key? key, required this.title, required this.model}) : super(key: key);

  final String title;
  final RegisterModel model;

  @override
  _SignUpPage2State createState() => _SignUpPage2State(model);
}

/*TODO
   - Colocar as validações corretas
   - Trocar o botão de genero por um dropdown button
   - Continuar para pagina 3


*/

class _SignUpPage2State extends State<SignUpPage2> {
  _SignUpPage2State(this.model);
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
                          children: <Widget>[SignUpForm2(model: model)],
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
                                "assets/images/signUpPageIndicators/signUpPageIndicator02.png",
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
                    child: IconButton(splashRadius: 20,
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignUpPage2(
                                    title: "Close SignUp Page 2",
                                    model: model,
                                  )),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignUpPage(
                                    title: "SignUp Page 1",
                                  )),
                        );
                      },
                      icon: Image.asset("assets/images/backArrow.png"),
                      iconSize: 31,
                    )
                )],
            ),
          ],
        ),
      ),
    );
  }
}
