import 'dart:io';

import 'package:aluguei/ui/addProduct/addProductScreen.dart';
import 'package:aluguei/ui/alertboxes/logOffConfirmation.dart';
import 'package:aluguei/ui/home/favoritesScreen.dart';
import 'package:aluguei/ui/home/searchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

int currentTab = 0;


class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> screens = [SearchScreen(), FavoriteScreen()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = SearchScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: Container(
          height: CustomDimens.navigationBarFloatingButtonSize,
          width: CustomDimens.navigationBarFloatingButtonSize,
          child: FittedBox(
            child: FloatingActionButton(
                backgroundColor: CustomColors.primaryColor,
                child: Icon(
                  Icons.add,
                  size: CustomDimens.navigationBarFloatingButtonIconSize,
                ),
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                              title: "Close Home Screen",
                            )),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddProductScreen(
                              title: "Open Add Product Screen",
                            )),
                  );
                }),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //LEFT ROW
              Row(
                children: [
                  // SearchScreen Button
                  Container(
                    width: MediaQuery.of(context).size.width / 5,
                    child: MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = SearchScreen();
                          currentTab = 0;
                        });

                        /*TODO ADICIONAR OS OUTROS BOTOES,
                      adicinar um material button na row da barra e passar a tela
                      no "currentScreen" e passar o indice no currentTab
                       */
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(
                              Icons.home_outlined,
                              color: currentTab == 0
                                  ? CustomColors.darkPrimaryColor
                                  : CustomColors.textGrey,
                              size: CustomDimens.navigationBarIconSize,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 5,
                      child: MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = FavoriteScreen();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: currentTab == 1
                                    ? CustomColors.darkPrimaryColor
                                    : CustomColors.textGrey,
                                size: CustomDimens.navigationBarIconSize,
                              ),
                            )
                          ],
                        ),
                      ))

                  // FavoriteScreen Button
                ],
              ),
              //RIGHT ROW
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SearchScreen Button

                  Container(
                    width: MediaQuery.of(context).size.width / 5,
                    child: MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = FavoriteScreen();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(
                              Icons.person_outline,
                              color: currentTab == 3
                                  ? CustomColors.darkPrimaryColor
                                  : CustomColors.textGrey,
                              size: CustomDimens.navigationBarIconSize,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),Container(
                    width: MediaQuery.of(context).size.width / 5,
                    child: MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        showAlertDialog(context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(
                              Icons.logout,
                              color: CustomColors.textGrey,
                              size: CustomDimens.navigationBarIconSize,
                            ),
                          )
                        ],
                      ),
                    ),
                  )

                  // FavoriteScreen Button
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
