import 'dart:html';
import 'dart:ui';
import 'package:aluguei/resources/strings.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 5,
          child: Scaffold(
            backgroundColor: CustomColors.greyBackgroundColor,
            appBar: AppBar(
                toolbarHeight: 130.0,
                title: Padding(
                    padding: const EdgeInsets.fromLTRB(
                        CustomDimens.verySmallSpacing,
                        CustomDimens.smallSpacing,
                        0.0,
                        0.0),
                    child: Container(
                      height: 50.0,
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: CustomDimens.fieldFontSize,
                            color: CustomColors.textGrey,
                            height: CustomDimens.fieldHeight),
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {},
                              splashRadius: 15,
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.search,
                                size: 40,
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
                          if (value == null ||
                              value.isEmpty ||
                              !EmailValidator.validate(value)) {
                            return Strings.fieldEmailNull;
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
                          width: 70,
                          child: IconButton(
                              splashRadius: 25,
                              onPressed: () {
                                //TODO AÇÃO DO BOTAO NOTIFICAÇÃO
                              },
                              icon: Icon(
                                Icons.notifications_none,
                                size: 40,
                              ))))
                ],
                bottom: PreferredSize(
                    preferredSize: Size(100.0, 100.0),
                    child: Container(
                      height: 40,
                      child: TabBar(
                        labelPadding: EdgeInsets.all(0),
                        tabs: [
                          Tab(
                            child: Text(
                              Strings.AppBarAllTab,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            child: Text(
                              Strings.AppBarLeisureTab,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            child: Text(
                              Strings.AppBarEletronicsTab,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            child: Text(
                              Strings.AppBarToolsTab,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            child: Text(
                              Strings.AppBarOtherTab,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ))),
            body: Center(child: Text('WIP')),
          ),
        ));
  }
}
