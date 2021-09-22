import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/ui/addProduct/addProductScreenForm.dart';
import 'package:aluguei/ui/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key, required String title}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [AddProductScreenForm()]),
      appBar: AppBar(
        toolbarHeight: CustomDimens.appBarHeight,
        backgroundColor: CustomColors.primaryColor,
        title: Container(alignment: Alignment.center,
            child: Padding(
          padding: const EdgeInsets.fromLTRB(
              0.0, CustomDimens.smallSpacing, CustomDimens.largeSpacing, 0.0),
          child: Text(
            'Anunciar Produto',
            style: TextStyle(fontSize: CustomFontSize.mediumFontSize,fontWeight: FontWeight.bold),
          ),
        )),
        leading: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, CustomDimens.smallSpacing,
                CustomDimens.verySmallSpacing, 0.0),
            child: Container(
                width: CustomDimens.alertIconSpacing,
                child: IconButton(
                    splashRadius: CustomDimens.appBarIconSplashRadius,
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddProductScreen(
                                  title: "Close Add Product Screen",
                                )),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                  title: "Open Home Page",
                                )),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: CustomDimens.appBarIconSize,
                    )))),
      ),
    );
  }
}
