import 'package:aluguei/repository/api/appExceptions.dart';
import 'package:aluguei/repository/productsRepository.dart';
import 'package:aluguei/ui/errors/errorsMessages.dart';
import 'package:aluguei/ui/home/product/productData.dart';
import 'package:aluguei/ui/home/product/productDialog.dart';
import 'package:aluguei/ui/home/product/productItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeListViewLayout extends StatefulWidget {
  const HomeListViewLayout({required this.productList});

  final List<ProductData> productList;

  @override
  HomeListView createState() {
    return new HomeListView(productList);
  }
}

class HomeListView extends State<HomeListViewLayout> {
  HomeListView(this.productList);

  final List<ProductData> productList;

  final ProductsRepository repository = ProductsRepository();

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
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ProductItemViewLayout(
            title: productList[index].productName,
            category: productList[index].category,
            value: productList[index].value.toString(),
            time: productList[index].rentTime.toString(),
            image: "",
            action: () =>
                showProductDialog(productList[index], productList[index].id),
          );
        });
  }
}
