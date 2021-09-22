import 'package:aluguei/repository/api/appExceptions.dart';
import 'package:aluguei/repository/productsRepository.dart';
import 'package:aluguei/ui/errors/errorsMessages.dart';
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

  final ProductsRepository repository = ProductsRepository();

  List<String> titles = ["BMW Eletrica", "Microondas", "Composteira"];
  final categories = ["Automovel", "Eletronicos", "Sustentavel"];
  final values = ["RS 10", "RS 20", "RS 30"];
  final times = ["\u005CHora", "\u005CDia", "\u005CMes"];
  final product = ProductData(
    0,
    "Macbook pro",
    "Notebook ",
    "https://picsum.photos/250?image=9",
    "200,00",
    "mês",
    "Notebook Mac novinho, pouco usado e com todos os aplicativos para seu uso escolar ou profissional! Possui photoshop original. ",
    Advertiser("Rodolfinho", "Acre", "Alagoinha"),
  );

  //TODO a chamda do rent product esta funcionando, so tem que passar um id valido que provavelmente vem da lista de produtos disponiveis
  showProductDialog(productData, productId) {
    final productDialog = ProductDialog.of(
      context,
      productData,
      () => rentProduct(productId),
    );
    productDialog.show();
  }

  Future<void> rentProduct(productId) async {
    try {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Alugaaaaaa")));
      await repository.rentProduct(productId);
    } on FetchDataException catch (e) {
      print(e.toString());
      //TODO trocar apresentacao do erro depois
      ErrorsMessages.showGenericErrorMessage(context);
    } catch (e) {
      print(e.toString());
      //TODO trocar apresentacao do erro depois
      ErrorsMessages.showLoginErrorMessage(context);
    }
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
            action: () =>
                showProductDialog(product, index),
          );
        });
  }
}
