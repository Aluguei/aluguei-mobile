import 'package:aluguei/repository/api/appExceptions.dart';
import 'package:aluguei/repository/productsRepository.dart';
import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:aluguei/ui/errors/errorsMessages.dart';
import 'package:aluguei/ui/home/homeListView.dart';
import 'package:aluguei/ui/home/product/productData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ProductsRepository repository = ProductsRepository();
  List<ProductData> listProducts = [];

  Future<List<ProductData>> getProductsList() async {
    try {
      return await repository
          .getAvailableProducts()
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

  //TODO USAR NA PESQUISA
  Future<List<ProductData>> searchProduct(String searchString) async {
    try {
      return await repository
          .searchProduct(searchString)
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

  Future<List<ProductData>>? products;

  @override
  void initState() {
    products = getProductsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    products = getProductsList();

    return DefaultTabController(
      length: CustomDimens.appBarLength,
      child: Scaffold(
        backgroundColor: CustomColors.greyHomeBackgroundColor,
        body: TabBarView(children: [
          // CALL ALL PRODUCTS
          FutureBuilder(
            future: products,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return HomeListViewLayout(
                  productList: listProducts,
                  onRentAction: () {
                    setState(() {});
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          //CALL ONLY LEISURE PRODUCTS
          FutureBuilder(
            future: products,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //TODO filtar a listProducts pela categoria e passar na productList a lista filtrada
                final leisureList = listProducts
                    .where(
                        (product) => product.category.toLowerCase() == "lazer")
                    .toList();
                return HomeListViewLayout(
                  productList: leisureList,
                  onRentAction: () {
                    setState(() {});
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          // CALL ONLY ELECTRONICS PRODUCTS
          FutureBuilder(
            future: products,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //TODO filtar a listProducts pela categoria e passar na productList a lista filtrada
                final electronicsList = listProducts
                    .where((product) =>
                        product.category.toLowerCase() == "eletronico")
                    .toList();
                return HomeListViewLayout(
                  productList: electronicsList,
                  onRentAction: () {
                    setState(() {});
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          FutureBuilder(
            future: products,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //TODO qual categoria eh aqui?
                final xList = listProducts
                    .where((product) => product.category.toLowerCase() == "x")
                    .toList();
                return HomeListViewLayout(
                  productList: xList,
                  onRentAction: () {
                    setState(() {});
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          FutureBuilder(
            future: products,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //TODO qual categoria eh aqui?
                final xList = listProducts
                    .where((product) => product.category.toLowerCase() == "x")
                    .toList();
                return HomeListViewLayout(
                  productList: xList,
                  onRentAction: () {
                    setState(() {});
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ]),
        appBar: AppBar(
            toolbarHeight: CustomDimens.appBarHeight,
            backgroundColor: CustomColors.primaryColor,
            title: Padding(
                padding: const EdgeInsets.fromLTRB(
                    CustomDimens.verySmallSpacing,
                    CustomDimens.smallSpacing,
                    0.0,
                    0.0),
                child: Container(
                  height: CustomDimens.appBarTextFieldHeight,
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: CustomDimens.fieldFontSize,
                        color: CustomColors.textGrey,
                        height: CustomDimens.fieldHeight),
                    onChanged: (String value) {
                      //TODO CHAMAR A IP PARA PESQUISAR searchProduct
                      //TODO atualizar a tela com a lista de retorno da
                      final searchList = searchProduct(value);
                      print(value);
                      print("Resultado da pesquisa: $searchList");
                    },
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
                            borderSide: BorderSide(
                                color: CustomColors.fieldBorderColor)),
                        labelText: Strings.fieldSearchTittle,
                        labelStyle: TextStyle(color: CustomColors.textGrey),
                        fillColor: CustomColors.greyBackgroundColor,
                        filled: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return Strings.fieldSearchNull;
                      }

                      return null;
                    },
                  ),
                )),
            actions: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(
                      0.0,
                      CustomDimens.smallSpacing,
                      CustomDimens.verySmallSpacing,
                      0.0),
                  child: Container(
                      width: CustomDimens.alertIconSpacing,
                      child: IconButton(
                          splashRadius: CustomDimens.appBarIconSplashRadius,
                          onPressed: () {
                            //TODO AÇÃO DO BOTAO NOTIFICAÇÃO
                          },
                          icon: Icon(
                            Icons.notifications_none,
                            size: CustomDimens.appBarIconSize,
                          ))))
            ],
            bottom: PreferredSize(
                preferredSize: Size(100.0, 100.0),
                child: Container(
                  height: CustomDimens.tabBarHeight,
                  child: TabBar(
                    labelPadding: EdgeInsets.all(0),
                    indicatorColor: CustomColors.white,
                    tabs: [
                      Tab(
                        child: Text(
                          Strings.AppBarAllTab,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: CustomFontSize.smallFontSize),
                        ),
                      ),
                      Tab(
                        child: Text(
                          Strings.AppBarLeisureTab,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: CustomFontSize.smallFontSize),
                        ),
                      ),
                      Tab(
                        child: Text(
                          Strings.AppBarElectronicsTab,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: CustomFontSize.smallFontSize),
                        ),
                      ),
                      Tab(
                        child: Text(
                          Strings.AppBarToolsTab,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: CustomFontSize.smallFontSize),
                        ),
                      ),
                      Tab(
                        child: Text(
                          Strings.AppBarOtherTab,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: CustomFontSize.smallFontSize),
                        ),
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }
}
