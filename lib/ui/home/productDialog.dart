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
            child: Image.asset('assets/images/aluguei_loading.gif',
                width:CustomDimens.animationLoadingSize, height:CustomDimens.animationLoadingSize)
        ));
  }
}