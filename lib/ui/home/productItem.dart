import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItemViewLayout extends StatefulWidget {
  const ProductItemViewLayout({required this.title, required this.subTitle, required this.image});

  final String title;
  final String subTitle;
  final String image;

  @override
  ProductItemView createState() {
    return new ProductItemView(title, subTitle, image);
  }
}

class ProductItemView extends State<ProductItemViewLayout> {
  ProductItemView(this.title, this.subTitle, this.image);

  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            onTap: () {
              //TODO listener
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
