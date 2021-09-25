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

  //TODO chamada da lista de produtos do back
  Future<List<ProductData>> getProductsList() async {
    try {
      return await repository.getAvailableProducts().then((value) => listProducts = value);
    } on FetchDataException catch (e) {
      print(e.toString());
      ErrorsMessages.showGenericErrorMessage(context);
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).
      showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return [];
  }

  final product = ProductData(
    id: 0,
    productName: "Macbook pro",
    category: "Notebook ",
    value: 200,
    rentTime: "2",
    timeUnit: 1,
    isActive: true,
    isLent: true,
    description:
        "Notebook Mac novinho, pouco usado e com todos os aplicativos para seu uso escolar ou profissional! Possui photoshop original. ",
    advertiser: Advertiser(
        id: 1,
        name: "Rodolfinho",
        fullName: "Rodolfinho",
        lastName: "Rodolfinho",
        address: "Acre",
        state: "Acre",
        city: "Alagoinha"),
  );

  @override
  Widget build(BuildContext context) {
    final products = getProductsList();

    return DefaultTabController(
      length: CustomDimens.appBarLength,
      child: Scaffold(
        backgroundColor: CustomColors.greyHomeBackgroundColor,
        body: FutureBuilder(
          future: products,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return HomeListViewLayout(
                productList: listProducts,
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
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
