import 'package:aluguei/resources/strings.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: CustomColors.greyBackgroundColor,
        appBar: AppBar(
            title: Padding(
          padding: const EdgeInsets.fromLTRB(CustomDimens.verySmallSpacing,
              CustomDimens.smallSpacing, CustomDimens.smallSpacing, CustomDimens.verySmallSpacing),
          child: TextFormField(
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

              return null;
            },
          ),
        ),
        actions: [

          //Icon(Image.asset('alertBell.png'))

          ],
        ),

        body: Center(child: Text('WIP')),
      ),
    );
  }
}
