import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageDialog {
  final BuildContext _context;
  final String message;
  final VoidCallback action;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show() {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return MessageDialogLayout(message: message, action: action);
        });
  }

  MessageDialog._create(this._context, this.message, this.action);

  factory MessageDialog.of(
      BuildContext context, String message, VoidCallback action) {
    return MessageDialog._create(context, message, action);
  }
}

class MessageDialogLayout extends StatelessWidget {
  const MessageDialogLayout({required this.message, required this.action});

  final String message;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(color: CustomColors.backgroundGrey),
        child: GestureDetector(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing, 0.0,
                  CustomDimens.smallSpacing, 0.0),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: CustomColors.primaryColor,
                          size: CustomFontSize.closeButtonSize,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Text(message,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          wordSpacing: 0,
                          letterSpacing: 0,
                          fontSize: CustomFontSize.mediumTextSize,
                          color: CustomColors.blackText,
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          CustomDimens.mediumSpacing,
                          CustomDimens.xSmallSpacing,
                          CustomDimens.mediumSpacing,
                          CustomDimens.xSmallSpacing),
                      child: Container(
                        width: double.infinity,
                        height: CustomDimens.buttonHeight,
                        child: OutlinedButton(
                          child: Text(
                            Strings.okButtonText,
                            style: TextStyle(
                                color: CustomColors.white,
                                fontSize: CustomFontSize.smallOutlinedButton),
                          ),
                          onPressed: () {
                            action();
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return CustomColors.darkPrimaryColor;
                                }
                                return CustomColors.primaryColor;
                              },
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          onTap: () {},
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
