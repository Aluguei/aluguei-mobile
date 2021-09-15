import 'package:aluguei/resources/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDialog {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show() {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return _FullScreenLoader();
        });
  }

  ProductDialog._create(this._context);

  factory ProductDialog.of(BuildContext context) {
    return ProductDialog._create(context);
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: CustomColors.backgroundGrey),
        child: Center(
            child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Text("TEsteeeee alalalala lala",
                  style: TextStyle(
                    fontFamily: 'TTNorms',
                    fontWeight: FontWeight.bold,
                    wordSpacing: 0,
                    letterSpacing: 0,
                    fontSize: 25,
                    color: Colors.yellow,
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing,
                    CustomDimens.smallSpacing, CustomDimens.smallSpacing, 0.0),
                child: Image.asset(
                  'assets/images/logo_aluguei.png',
                  height: CustomDimens.logoSize,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        )));
  }
}
