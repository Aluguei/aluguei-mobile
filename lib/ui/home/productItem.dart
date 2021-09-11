import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItemViewLayout extends StatefulWidget {
  const ProductItemViewLayout(
      {required this.title,
      required this.subTitle,
      required this.image,
      required this.action});

  final String title;
  final String subTitle;
  final String image;
  final VoidCallback action;

  @override
  ProductItemView createState() {
    return new ProductItemView(title, subTitle, image, action);
  }
}

class ProductItemView extends State<ProductItemViewLayout> {
  ProductItemView(this.title, this.subTitle, this.image, this.action);

  final String title;
  final String subTitle;
  final String image;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () {
        action();
      },
      title: Text(title),
      subtitle: Text(subTitle),
      leading: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
      // trailing: Icon(icons[index])
    ));
  }
}
