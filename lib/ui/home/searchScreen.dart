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
  var isFromRent = true;
  var searchText = "";

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
  void didChangeDependencies() {
    if (isFromRent || searchText.isEmpty) {
      products = getProductsList();
    } else {
      products = searchProduct(searchText);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (isFromRent || searchText.isEmpty) {
      products = getProductsList();
    } else {
      products = searchProduct(searchText);
    }

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
                    isFromRent = true;
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
                final leisureList = listProducts
                    .where(
                        (product) => product.category.toLowerCase() == "sports")
                    .toList();
                return HomeListViewLayout(
                  productList: leisureList,
                  onRentAction: () {
                    isFromRent = true;
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
                final electronicsList = listProducts
                    .where((product) =>
                        product.category.toLowerCase() == "technology")
                    .toList();
                return HomeListViewLayout(
                  productList: electronicsList,
                  onRentAction: () {
                    isFromRent = true;
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
                final toolsList = listProducts
                    .where(
                        (product) => product.category.toLowerCase() == "tools")
                    .toList();
                return HomeListViewLayout(
                  productList: toolsList,
                  onRentAction: () {
                    isFromRent = true;
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
                final vehicleList = listProducts
                    .where((product) =>
                        product.category.toLowerCase() == "vehicle")
                    .toList();
                return HomeListViewLayout(
                  productList: vehicleList,
                  onRentAction: () {
                    isFromRent = true;
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
                final fashionList = listProducts
                    .where((product) =>
                        product.category.toLowerCase() == "fashion")
                    .toList();
                return HomeListViewLayout(
                  productList: fashionList,
                  onRentAction: () {
                    isFromRent = true;
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
            automaticallyImplyLeading: false,
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
                    onChanged: (text) {
                      isFromRent = false;
                      searchText = text;
                      setState(() {});
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
            actions: [],
            bottom: PreferredSize(
                preferredSize: Size(100.0, 100.0),
                child: Container(
                  height: CustomDimens.tabBarHeight,
                  child: TabBar(
                    labelPadding: EdgeInsets.all(0),
                    indicatorColor: CustomColors.white,
                    tabs: [
                      Tab(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            Strings.AppBarAllTab,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: CustomFontSize.smallFontSize),
                          ),
                        ),
                      ),
                      Tab(
                          child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          Strings.AppBarLeisureTab,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: CustomFontSize.smallFontSize),
                        ),
                      )),
                      Tab(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            Strings.AppBarElectronicsTab,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: CustomFontSize.smallFontSize),
                          ),
                        ),
                      ),
                      Tab(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            Strings.AppBarToolsTab,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: CustomFontSize.smallFontSize),
                          ),
                        ),
                      ),
                      Tab(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            Strings.AppBarVehicleTab,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: CustomFontSize.smallFontSize),
                          ),
                        ),
                      ),
                      Tab(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            Strings.AppBarFashionTab,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: CustomFontSize.smallFontSize),
                          ),
                        ),
                      )
                    ],
                  ),
                ))),
      ),
    );
  }
}
