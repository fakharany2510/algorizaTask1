import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defaultTextFormFieldWidget(
    {
      context,
      required TextEditingController controller,
      required TextInputType inputType,
      required String labelText,
      required String errorMessage,
      required IconData prefixIcon
    }
    )=>TextFormField(
  style: TextStyle(
      color: Colors.black
  ),
  keyboardType: inputType,
  controller: controller,
  decoration: InputDecoration(
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: HexColor('##28383f')),
      borderRadius: BorderRadius.circular(15),
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15)
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color:Colors.indigo),
      borderRadius: BorderRadius.circular(15),
    ),
    label: Text('${labelText}',style: TextStyle(
      color: HexColor('#92e3a9'),
    ),),
    prefixIcon: Icon(prefixIcon,color:HexColor('#92e3a9')),
  ),
  validator: (value){
    if(value!.isEmpty){
      return'${errorMessage}';
    }
  },
);

