import 'package:aluguei/ui/home/productDialog.dart';
import 'package:aluguei/ui/home/productItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeListViewLayout extends StatefulWidget {
  @override
  HomeListView createState() {
    return new HomeListView();
  }
}

class HomeListView extends State<HomeListViewLayout> {
  //TODO pegar lista do backend

  List<String> titles = ["BMW Eletrica", "Microondas", "Composteira"];
  final categories = [
    "Automovel",
    "Eletronicos",
    "Sustentavel"
  ];
  final values = [
    "RS 10",
    "RS 20",
    "RS 30"
  ];
  final times = [
    "\u005CHora",
    "\u005CDia",
    "\u005CMes"
  ];

  onItemClicked(text) {
    final productDialog = ProductDialog.of(context);
    productDialog.show();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return ProductItemViewLayout(
            title: titles[index],
            category: categories[index],
            value: values[index],
            time: times[index],
            image: "",
            action: () => onItemClicked('Teste de clique no item ${index+1}'),
          );
        });
  }
}
