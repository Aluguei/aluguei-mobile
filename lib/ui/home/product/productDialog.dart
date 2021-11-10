import 'dart:io';

import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:aluguei/ui/home/product/productData.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDialog {
  final BuildContext _context;
  final ProductData data;
  final VoidCallback rentAction;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show() {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProductDialogLayout(
            data: data,
            rentAction: rentAction,
            context: _context,
          );
        });
  }

  ProductDialog._create(this._context, this.data, this.rentAction);

  factory ProductDialog.of(
      BuildContext context, ProductData data, VoidCallback rentAction) {
    return ProductDialog._create(context, data, rentAction);
  }
}

class ProductDialogLayout extends StatelessWidget {
  const ProductDialogLayout({required this.data, required this.rentAction, required this.context});

  final ProductData data;
  final VoidCallback rentAction;
  final BuildContext context;

  openWhatsapp() async {
    //TODO colocar o tel certo data.advertiser.?
    var whatsapp = "+919144040888";
    var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp";
    var whatsappURLIos = "https://wa.me/$whatsapp";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatsappURLIos)) {
        await launch(whatsappURLIos, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURlAndroid)) {
        await launch(whatsappURlAndroid);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(color: CustomColors.backgroundGrey),
        child: GestureDetector(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing, 0.0,
                  CustomDimens.smallSpacing, 0.0),
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
                    Text(data.productName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          wordSpacing: 0,
                          letterSpacing: 0,
                          fontSize: CustomFontSize.mediumTextSize,
                          color: CustomColors.blackText,
                        )),
                    Text(data.category,
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
                          0.0),
                      child: CachedNetworkImage(
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        imageUrl: data.imageUrl,
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
                              "${Strings.valueIndicator}${data.value}",
                              style: TextStyle(
                                  fontSize: CustomFontSize.xLargeFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.orange),
                            ),
                            Text(
                              "${Strings.separator}${data.timeUnit}",
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
                        Strings.productDescriptionText,
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
                      child: Text(data.description,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            wordSpacing: 0,
                            letterSpacing: 0,
                            fontSize: CustomFontSize.smallTextSize,
                            color: CustomColors.blackText,
                          )),
                    ),
                    Text(Strings.advertiserText,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          wordSpacing: 0,
                          letterSpacing: 0,
                          fontSize: CustomFontSize.mediumTextSize,
                          color: CustomColors.blackText,
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(
                            CustomDimens.mediumSpacing,
                            CustomDimens.xSmallSpacing,
                            CustomDimens.mediumSpacing,
                            0.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  Strings.advertiserName,
                                  style: TextStyle(
                                      fontSize: CustomFontSize.largeFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColors.blackText),
                                ),
                                Text(
                                  data.advertiser.name,
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
                                  Strings.advertiserState,
                                  style: TextStyle(
                                      fontSize: CustomFontSize.largeFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColors.blackText),
                                ),
                                Text(
                                  data.advertiser.state,
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
                                  Strings.advertiserCity,
                                  style: TextStyle(
                                      fontSize: CustomFontSize.largeFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColors.blackText),
                                ),
                                Text(
                                  data.advertiser.city,
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
                            Strings.chatButtonText,
                            style: TextStyle(
                                color: CustomColors.white,
                                fontSize: CustomFontSize.smallOutlinedButton),
                          ),
                          onPressed: () => openWhatsapp(),
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
                            Strings.rentButtonText,
                            style: TextStyle(
                                color: CustomColors.white,
                                fontSize: CustomFontSize.smallOutlinedButton),
                          ),
                          onPressed: () => rentAction(),
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
          onTap: () {},
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
