import 'package:aluguei/repository/productsRepository.dart';
import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/ui/errors/errorsMessages.dart';
import 'package:aluguei/ui/home/product/productData.dart';
import 'package:aluguei/ui/home/product/productDialog.dart';
import 'package:aluguei/ui/home/product/productItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'messageDialog.dart';

class HomeListViewLayout extends StatefulWidget {
  const HomeListViewLayout(
      {required this.productList, required this.onRentAction});

  final List<ProductData> productList;
  final VoidCallback onRentAction;

  @override
  HomeListView createState() {
    return new HomeListView(productList, onRentAction);
  }
}

class HomeListView extends State<HomeListViewLayout> {
  HomeListView(this.productList, this.onRentAction);

  var productDialogContext;
  var successDialogContext;

  final List<ProductData> productList;
  final VoidCallback onRentAction;

  final ProductsRepository repository = ProductsRepository();

  showProductDialog(productData, productId) {
    final productDialog = ProductDialog.of(
      productDialogContext = context,
      productData,
      () => rentProduct(productId).then((value) => showSuccess()),
    );
    productDialog.show();
  }

  showSuccess() {
    final successDialog = MessageDialog.of(successDialogContext = context,
        "Alugado com sucesso", () => closeAndReloadPage());
    successDialog.show();
  }

  closeAndReloadPage() {
    if (productDialogContext != null) {
      Navigator.of(productDialogContext).pop();
    }
    if (successDialogContext != null) {
      Navigator.of(successDialogContext).pop();
    }
    onRentAction();
  }

  Future<void> rentProduct(productId) async {
    try {
      await repository.rentProduct(productId);
    } catch (e) {
      print(e.toString());
      ErrorsMessages.showGenericErrorMessage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (productList.isNotEmpty) {
      return ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductItemViewLayout(
              title: productList[index].productName,
              category: productList[index].category,
              value: productList[index].value.toString(),
              time: productList[index].rentTime.toString(),
              image: productList[index].imageUrl,
              action: () =>
                  showProductDialog(productList[index], productList[index].id),
            );
          });
    } else {
      return Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                CustomDimens.smallSpacing,
                CustomDimens.smallSpacing,
                CustomDimens.smallSpacing,
                CustomDimens.smallSpacing),
            child: Text(
              "Nenhum item encontrado",
              style: TextStyle(
                  color: CustomColors.darkPrimaryColor,
                  fontSize: CustomFontSize.xLargeFontSize),
            ),
          ));
    }
  }
}
