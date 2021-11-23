import 'package:aluguei/resources/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItemViewLayout extends StatefulWidget {
  const ProductItemViewLayout(
      {required this.title,
      required this.category,
      required this.value,
      required this.time,
      required this.image,
      required this.action});

  final String title;
  final String category;
  final String value;
  final String time;
  final String image;
  final VoidCallback action;

  @override
  ProductItemView createState() {
    return new ProductItemView(title, category, value, time, image, action);
  }
}

class ProductItemView extends State<ProductItemViewLayout> {
  ProductItemView(this.title, this.category, this.value, this.time, this.image,
      this.action);

  final String title;
  final String category;
  final String value;
  final String time;
  final String image;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing,
            CustomDimens.xSmallSpacing, CustomDimens.smallSpacing, 0.0),
        child: Card(
          elevation: 3,
          color: CustomColors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(CustomDimens.xSmallSpacing),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            title,
                            style: new TextStyle(
                                fontSize: CustomFontSize.CardNameFontSize,
                                fontWeight: FontWeight.bold),
                          )),
                      new FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            category,
                            style: new TextStyle(
                                fontSize: CustomFontSize.CardCategoryFontSize,
                                fontWeight: FontWeight.normal,
                                color: CustomColors.textGrey),
                          )),
                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 55.0, 0.0, 0.0),
                          child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                children: [
                                  Text(
                                    value,
                                    style: TextStyle(
                                        fontSize:
                                            CustomFontSize.CardPriceFontSize,
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.orange),
                                  ),
                                  Text(
                                    time,
                                    style: TextStyle(
                                        fontSize:
                                            CustomFontSize.CardTimeUnitFontSize,
                                        fontWeight: FontWeight.normal,
                                        color: CustomColors.orange),
                                  )
                                ],
                              ))),
                    ],
                  ),
                ),
              ),
              Padding(

                padding: const EdgeInsets.all(CustomDimens.xSmallSpacing),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    imageUrl: image,
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
