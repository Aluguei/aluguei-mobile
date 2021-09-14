import 'dart:ui';
import 'package:aluguei/ui/home/favoritesScreen.dart';
import 'package:aluguei/ui/home/searchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/constants.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
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
            child: FloatingActionButton(backgroundColor: CustomColors.primaryColor,
                child: Icon(
                  Icons.add,
                  size: CustomDimens.navigationBarFloatingButtonIconSize,
                ),
                onPressed: () {}),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(CustomDimens.navigationBarRadius),
            topRight: Radius.circular(CustomDimens.navigationBarRadius)),
        child: BottomAppBar(
          child: Container(
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //LEFT ROW
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SearchScreen Button
                    MaterialButton(
                      minWidth: CustomDimens.navigationBarButtonSize,
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
                    // FavoriteScreen Button
                    MaterialButton(
                      minWidth: CustomDimens.navigationBarButtonSize,
                      onPressed: () {
                        setState(() {
                          currentScreen = FavoriteScreen();
                          currentTab = 1;
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
                              Icons.favorite_border_outlined,
                              color: currentTab == 1
                                  ? CustomColors.darkPrimaryColor
                                  : CustomColors.textGrey,
                              size: CustomDimens.navigationBarIconSize,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                //RIGHT ROW
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SearchScreen Button
                    MaterialButton(
                      minWidth: CustomDimens.navigationBarButtonSize,
                      onPressed: () {
                        setState(() {
                          currentScreen = SearchScreen();
                          currentTab = 2;
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
                              Icons.chat_bubble_outline_rounded,
                              color: currentTab == 2
                                  ? CustomColors.darkPrimaryColor
                                  : CustomColors.textGrey,
                              size: CustomDimens.navigationBarIconSize,
                            ),
                          )
                        ],
                      ),
                    ),
                    // FavoriteScreen Button
                    MaterialButton(
                      minWidth: CustomDimens.navigationBarButtonSize,
                      onPressed: () {
                        setState(() {
                          currentScreen = FavoriteScreen();
                          currentTab = 3;
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
                              Icons.person_outline,
                              color: currentTab == 3
                                  ? CustomColors.darkPrimaryColor
                                  : CustomColors.textGrey,
                              size: CustomDimens.navigationBarIconSize,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
