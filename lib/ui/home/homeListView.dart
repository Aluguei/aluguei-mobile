import 'package:aluguei/ui/home/productItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeListViewLayout extends StatefulWidget {
  @override
  HomeListView createState() {
    return new HomeListView();
  }
}

class HomeListView extends State<HomeListViewLayout> {

  //TODO pegar lista do backend

  List<String> titles = ["List 1", "List 2", "List 3"];
  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"
  ];
  final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return ProductItemViewLayout(
              title: titles[index], subTitle: subtitles[index], image: "");
        });
  }
}
