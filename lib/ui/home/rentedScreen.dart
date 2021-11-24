import 'package:aluguei/repository/api/appExceptions.dart';
import 'package:aluguei/repository/productsRepository.dart';
import 'package:aluguei/resources/constants.dart';
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
