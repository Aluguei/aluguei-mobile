import 'package:aluguei/resources/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItemViewLayout extends StatefulWidget {
  const ProductItemViewLayout(
      {required this.title,
      required this.subTitle,
      required this.value,
      required this.image,
      required this.action});

  final String title;
  final String subTitle;
  final String value;
  final String image;
  final VoidCallback action;

  @override
  ProductItemView createState() {
    return new ProductItemView(title, subTitle, value, image, action);
  }
}

class ProductItemView extends State<ProductItemViewLayout> {
  ProductItemView(
      this.title, this.subTitle, this.value, this.image, this.action);

  final String title;
  final String subTitle;
  final String value;
  final String image;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 3,
        color: CustomColors.white,
        child: Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: new TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    subTitle,
                    style: new TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        value,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.33,
              child: Image.asset(
                "assets/images/logo_aluguei.png",
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        action();
      },
    );
  }
}
