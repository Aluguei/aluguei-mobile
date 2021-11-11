import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.greyHomeBackgroundColor,
      appBar: AppBar(
        toolbarHeight: CustomDimens.appBarHeight,
        backgroundColor: CustomColors.primaryColor,
        title: Padding(
            padding: const EdgeInsets.fromLTRB(CustomDimens.verySmallSpacing,
                CustomDimens.smallSpacing, CustomDimens.verySmallSpacing, 0.0),
            child: Container(
              height: CustomDimens.appBarTextFieldHeight,
              child: TextFormField(
                style: TextStyle(
                    fontSize: CustomDimens.fieldFontSize,
                    color: CustomColors.textGrey,
                    height: CustomDimens.fieldHeight),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      splashRadius: CustomDimens.appBarIconSplashRadius,
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.search,
                        size: CustomDimens.appBarIconSize,
                        color: CustomColors.primaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: CustomColors.fieldBorderColor)),
                    labelText: Strings.fieldSearchTittle,
                    labelStyle: TextStyle(color: CustomColors.textGrey),
                    fillColor: CustomColors.greyBackgroundColor,
                    filled: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.fieldEmailNull;
                  }

                  return null;
                },
              ),
            )),

      ),
    );
  }
}
