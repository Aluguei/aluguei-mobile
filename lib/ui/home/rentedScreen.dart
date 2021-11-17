import 'package:aluguei/repository/api/appExceptions.dart';
import 'package:aluguei/repository/productsRepository.dart';
import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:aluguei/ui/errors/errorsMessages.dart';
import 'package:aluguei/ui/home/product/rentedProductData.dart';
import 'package:aluguei/ui/home/productListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RentedScreen extends StatefulWidget {
  const RentedScreen({Key? key}) : super(key: key);

  @override
  _RentedScreenState createState() => _RentedScreenState();
}

class _RentedScreenState extends State<RentedScreen> {
  final ProductsRepository repository = ProductsRepository();
  List<RentedProductData> listProducts = [];

  Future<List<RentedProductData>>? products;

  Future<List<RentedProductData>> getMyRentedProducts() async {
    try {
      return await repository
          .getRentedProducts()
          .then((value) => listProducts = value);
    } on FetchDataException catch (e) {
      print(e.toString());
      ErrorsMessages.showGenericErrorMessage(context);
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    products = getMyRentedProducts();

    return Scaffold(
      backgroundColor: CustomColors.greyHomeBackgroundColor,
      appBar: AppBar(
        toolbarHeight: CustomDimens.appBarHeight,
        backgroundColor: CustomColors.primaryColor,
        title: Padding(
            padding: const EdgeInsets.fromLTRB(CustomDimens.verySmallSpacing,
                CustomDimens.smallSpacing, CustomDimens.verySmallSpacing, 0.0),
            child: Container(
              height: CustomDimens.appBarTextFieldHeight,
              child: TextFormField(
                style: TextStyle(
                    fontSize: CustomDimens.fieldFontSize,
                    color: CustomColors.textGrey,
                    height: CustomDimens.fieldHeight),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      splashRadius: CustomDimens.appBarIconSplashRadius,
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.search,
                        size: CustomDimens.appBarIconSize,
                        color: CustomColors.primaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: CustomColors.fieldBorderColor)),
                    labelText: Strings.fieldSearchTittle,
                    labelStyle: TextStyle(color: CustomColors.textGrey),
                    fillColor: CustomColors.greyBackgroundColor,
                    filled: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.fieldEmailNull;
                  }

                  return null;
                },
              ),
            )),
      ),
      body: Container(
        child: FutureBuilder(
          future: products,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ProductListViewLayout(
                productList: listProducts,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
