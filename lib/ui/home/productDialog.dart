import 'package:aluguei/resources/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDialog {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show() {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return _FullScreenLoader();
        });
  }

  ProductDialog._create(this._context);

  factory ProductDialog.of(BuildContext context) {
    return ProductDialog._create(context);
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: CustomColors.backgroundGrey),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              CustomDimens.smallSpacing, 0.0, CustomDimens.smallSpacing, 0.0),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: CustomColors.primaryColor,
                      size: CustomFontSize.closeButtonSize,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Text("Nome do produto",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      wordSpacing: 0,
                      letterSpacing: 0,
                      fontSize: CustomFontSize.mediumTextSize,
                      color: CustomColors.blackText,
                    )),
                Text("Categoria",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      wordSpacing: 0,
                      letterSpacing: 0,
                      fontSize: CustomFontSize.smallTextSize,
                      color: CustomColors.blackText,
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      CustomDimens.smallSpacing,
                      CustomDimens.smallSpacing,
                      CustomDimens.smallSpacing,
                      CustomDimens.smallSpacing),
                  child: Image.asset(
                    'assets/images/logo_aluguei.png',
                    height: CustomDimens.logoSize,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(
                        0.0, CustomDimens.minimumSpacing, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "RS89",
                          style: TextStyle(
                              fontSize: CustomFontSize.xlargeFontSize,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.orange),
                        ),
                        Text(
                          "\u005CHora",
                          style: TextStyle(
                              fontSize: CustomFontSize.smallFontSize,
                              fontWeight: FontWeight.normal,
                              color: CustomColors.orange),
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      0.0,
                      CustomDimens.xSmallSpacing,
                      0.0,
                      CustomDimens.xSmallSpacing),
                  child: Text(
                    "Descrição",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      wordSpacing: 0,
                      letterSpacing: 0,
                      fontSize: CustomFontSize.smallTextSize,
                      color: CustomColors.blackText,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      CustomDimens.mediumSpacing,
                      0.0,
                      CustomDimens.mediumSpacing,
                      CustomDimens.xSmallSpacing),
                  child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has bee...Ver mais",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        wordSpacing: 0,
                        letterSpacing: 0,
                        fontSize: CustomFontSize.smallTextSize,
                        color: CustomColors.blackText,
                      )),
                ),
                Text("Anunciante",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      wordSpacing: 0,
                      letterSpacing: 0,
                      fontSize: CustomFontSize.mediumTextSize,
                      color: CustomColors.blackText,
                    )),
                //TODO estrelinha

                Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Nome:",
                              style: TextStyle(
                                  fontSize: CustomFontSize.largeFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.blackText),
                            ),
                            Text(
                              "Samuel Ferracini",
                              style: TextStyle(
                                  fontSize: CustomFontSize.smallFontSize,
                                  fontWeight: FontWeight.normal,
                                  color: CustomColors.blackText),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Estado:",
                              style: TextStyle(
                                  fontSize: CustomFontSize.largeFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.blackText),
                            ),
                            Text(
                              "São Paulo",
                              style: TextStyle(
                                  fontSize: CustomFontSize.smallFontSize,
                                  fontWeight: FontWeight.normal,
                                  color: CustomColors.blackText),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Cidade:",
                              style: TextStyle(
                                  fontSize: CustomFontSize.largeFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.blackText),
                            ),
                            Text(
                              "Vinhedo",
                              style: TextStyle(
                                  fontSize: CustomFontSize.smallFontSize,
                                  fontWeight: FontWeight.normal,
                                  color: CustomColors.blackText),
                            )
                          ],
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      CustomDimens.mediumSpacing,
                      CustomDimens.xSmallSpacing,
                      CustomDimens.mediumSpacing,
                      CustomDimens.xSmallSpacing),
                  child: Container(
                    width: double.infinity,
                    height: CustomDimens.buttonHeight,
                    child: OutlinedButton(
                      child: Text(
                        "Alugar",
                        style: TextStyle(
                            color: CustomColors.white,
                            fontSize: CustomFontSize.smallOutlinedButton),
                      ),
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
