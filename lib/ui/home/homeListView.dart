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
    "RS 10,00",
    "RS 20,00",
    "RS 30,00"
  ];

  onItemClicked(text) {
    //TODO
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
    });
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
            image: "",
            action: () => onItemClicked('Teste de clique no item ${index+1}'),
          );
        });
  }
}
