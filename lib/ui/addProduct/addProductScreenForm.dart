import 'dart:io';

import 'package:aluguei/repository/models/products/productModel.dart';
import 'package:aluguei/ui/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:flutter/rendering.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreenForm extends StatefulWidget {
  const AddProductScreenForm({Key? key}) : super(key: key);

  @override
  AddProductScreenFormState createState() {
    return AddProductScreenFormState();
  }
}

class AddProductScreenFormState extends State<AddProductScreenForm> {
  final _formKey = GlobalKey<FormState>();
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      this.image = imageTemporary;
    } on PlatformException catch (e) {
      print('Failed to pick a image: $e');
    }
  }

  String dropdownPriceValue = 'Hora';
  final model = ProductModel(
    "",
    "",
    "",
    0,
    0,
    "",
  );

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing,
                CustomDimens.smallSpacing, CustomDimens.smallSpacing, 0.0),
            child: Container(
                width: 200,
                height: 200,
                child: IconButton(
                    onPressed: () => pickImage(),
                    icon: image != null
                        ? Image.file(
                            image!,
                          )
                        : Image.asset(
                            'assets/images/addProductPhoto.png',
                          ))),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing,
                  CustomDimens.smallSpacing, CustomDimens.smallSpacing, 0.0),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: TextStyle(
                    fontSize: CustomDimens.fieldFontSize,
                    color: CustomColors.textGrey,
                    height: CustomDimens.fieldHeight),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: CustomColors.fieldBorderColor)),
                    labelText: Strings.fieldProductNameTitle,
                    labelStyle: TextStyle(color: CustomColors.textGrey),
                    fillColor: CustomColors.greyBackgroundColor,
                    filled: true),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !EmailValidator.validate(value)) {
                    return Strings.fieldProductNameNull;
                  }
                  model.name = value;
                  return null;
                },
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing,
                CustomDimens.smallSpacing, CustomDimens.smallSpacing, 0.0),
            child: SizedBox(
                height: CustomDimens.addProductTextBoxLineSize *
                    CustomDimens.addProductTextBoxMaxLines,
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  autocorrect: true,
                  maxLines: CustomDimens.addProductTextBoxMaxLines,
                  textAlignVertical: TextAlignVertical.top,
                  enableSuggestions: true,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                    fontSize: CustomDimens.fieldFontSize,
                    color: CustomColors.textGrey,
                    height: CustomDimens.fieldHeight,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: CustomColors.fieldBorderColor),
                    ),
                    labelText: Strings.fieldDescriptionTitle,
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(color: CustomColors.textGrey),
                    fillColor: CustomColors.greyBackgroundColor,
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return Strings.fieldDescriptionNull;
                    }
                    model.description = value;
                    return null;
                  },
                )),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing, 5.0,
                  CustomDimens.smallSpacing, 0.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 3,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                            fontSize: CustomDimens.fieldFontSize,
                            color: CustomColors.textGrey,
                            height: CustomDimens.fieldHeight),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: CustomColors.fieldBorderColor)),
                            labelText: Strings.fieldPriceTitle,
                            labelStyle: TextStyle(color: CustomColors.textGrey),
                            fillColor: CustomColors.greyBackgroundColor,
                            filled: true),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !EmailValidator.validate(value)) {
                            return Strings.fieldPriceNull;
                          }
                          model.price = value as int;
                          return null;
                        },
                      )),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(Strings.fieldPricePer,style: TextStyle(fontSize: CustomFontSize.largeFontSize),),
                      ],

                    )
                  ),
                  Expanded(
                      flex: 3,
                      child: DropdownButtonFormField<String>(
                        value: dropdownPriceValue,
                        icon: const Icon(Icons.arrow_downward),
                        style: TextStyle(
                            fontSize: CustomDimens.fieldFontSize,
                            color: CustomColors.textGrey,
                            height: CustomDimens.fieldHeight),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: CustomColors.fieldBorderColor)),

                            labelStyle: TextStyle(color: CustomColors.textGrey),
                            fillColor: CustomColors.greyBackgroundColor,
                            filled: true),
                        iconSize: 24,
                        elevation: 16,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return Strings.fieldDropdownInvalidOption;
                          } else {
                            if (value == 'Hora') {
                              model.timeQuantity = 'hour';
                            } else if (value == 'Dia') {
                              model.timeQuantity = 'day';
                            } else if (value == 'Semana') {
                              model.timeQuantity = 'week';
                            } else {
                              model.timeQuantity = 'month';
                            }
                          }
                        },
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownPriceValue = newValue!;
                          });
                        },
                        items: Strings.fieldRentTimeScaleDropDownList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                ],
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(CustomDimens.smallSpacing,
                  CustomDimens.smallSpacing, CustomDimens.smallSpacing, 0.0),
              child: Container(
                  width: double.infinity,
                  height: CustomDimens.buttonHeight,
                  child: OutlinedButton(
                    child: Text(
                      Strings.rentText,
                      style: TextStyle(
                          color: CustomColors.white,
                          fontSize: CustomFontSize.smallOutlinedButton),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                    title: "Go to SignUpPage 2",
                                  )),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
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
                  ))),
        ],
      ),
    );
  }
}
