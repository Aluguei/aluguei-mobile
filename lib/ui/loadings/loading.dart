import 'package:aluguei/resources/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show() {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return _Loader();
        });
  }

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
  }

  Loading._create(this._context);

  factory Loading.of(BuildContext context) {
    return Loading._create(context);
  }
}

class _Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircularProgressIndicator(),
    );
  }
}
