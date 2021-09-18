import 'package:aluguei/ui/home/product/productData.dart';
import 'package:aluguei/ui/home/product/productDialog.dart';
import 'package:aluguei/ui/home/product/productItem.dart';
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
  final categories = ["Automovel", "Eletronicos", "Sustentavel"];
  final values = ["RS 10", "RS 20", "RS 30"];
  final times = ["\u005CHora", "\u005CDia", "\u005CMes"];

  onItemClicked(text) {
    //TODO product data mockado, deve ser pego do retorno do backend quando estiver ok
    final productDialog = ProductDialog.of(
      context,
      ProductData(
        "Fogão",
        "Eletrodomestico",
        "https://picsum.photos/250?image=9",
        "15,00",
        "mes",
        "O fogão é um utensílio culinário usado para cozinhar, geralmente em panelas ou frigideiras, e por meio de calor.",
        Advertiser("Rodolfinho", "Acre", "cidade teste"),
      ),
      () => rentProduct(),
    );
    productDialog.show();
  }

  rentProduct() {
    ScaffoldMessenger.of(context).
    showSnackBar(SnackBar(content: Text("Alugaaaaaa")));
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
            action: () => onItemClicked('Teste de clique no item ${index + 1}'),
          );
        });
  }
}
