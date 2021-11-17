import 'package:aluguei/repository/productsRepository.dart';
import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:aluguei/ui/errors/errorsMessages.dart';
import 'package:aluguei/ui/home/product/productData.dart';
import 'package:aluguei/ui/home/product/productDialog.dart';
import 'package:aluguei/ui/home/product/productItem.dart';
import 'package:aluguei/ui/home/product/rentedProductData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'messageDialog.dart';

class ProductListViewLayout extends StatefulWidget {
  const ProductListViewLayout(
      {required this.productList});

  final List<RentedProductData> productList;

  @override
  ProductListView createState() {
    return new ProductListView(productList);
  }
}

class ProductListView extends State<ProductListViewLayout> {
  ProductListView(this.productList);

  var productDialogContext;
  var successDialogContext;

  final List<RentedProductData> productList;

  final ProductsRepository repository = ProductsRepository();

  @override
  Widget build(BuildContext context) {
    if (productList.isNotEmpty) {
      return ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductItemViewLayout(
              title: productList[index].productName,
              category: productList[index].humanCategory,
              value: "${Strings.valueIndicator} ${productList[index].value.toString()}",
              time: "${Strings.separator} ${productList[index].humanTimeUnit}",
              image: productList[index].imageUrl,
              action: () => {},
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
