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
  final List<Widget> screens = [SearchScreen()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = SearchScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
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
                                ? CustomColors.primaryColor
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
    );
  }
}
