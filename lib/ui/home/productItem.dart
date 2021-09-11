import 'package:aluguei/resources/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItemViewLayout extends StatefulWidget {
  const ProductItemViewLayout(
      {required this.title,
      required this.category,
      required this.value,
      required this.image,
      required this.action});

  final String title;
  final String category;
  final String value;
  final String image;
  final VoidCallback action;

  @override
  ProductItemView createState() {
    return new ProductItemView(title, category, value, image, action);
  }
}

class ProductItemView extends State<ProductItemViewLayout> {
  ProductItemView(
      this.title, this.category, this.value, this.image, this.action);

  final String title;
  final String category;
  final String value;
  final String image;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(CustomDimens.xSmallSpacing,
            CustomDimens.xSmallSpacing, CustomDimens.xSmallSpacing, 0.0),
        child: Card(
          elevation: 3,
          color: CustomColors.white,
          child: Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(CustomDimens.xSmallSpacing),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: new TextStyle(
                            fontSize: CustomFontSize.mediumFontSize,
                            fontWeight: FontWeight.bold),
                      ),
                      new Text(
                        category,
                        style: new TextStyle(
                            fontSize: CustomFontSize.smallFontSize,
                            fontWeight: FontWeight.normal,
                            color: CustomColors.textGrey),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(
                              0.0, CustomDimens.minimumSpacing, 0.0, 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                value,
                                style: TextStyle(
                                    fontSize: CustomFontSize.mediumFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.orange),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(CustomDimens.xSmallSpacing),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.33,
                  child: Image.asset(
                    "assets/images/logo_aluguei.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        action();
      },
    );
  }
}
