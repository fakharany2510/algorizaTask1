import 'package:algoriza_intern_task1/utils/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../utils/appstrings.dart';

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
      color: AppColor.hintColor,
    ),),
    prefixIcon: Icon(prefixIcon,color:HexColor('#92e3a9')),
  ),
  validator: (value){
    if(value!.isEmpty){
      return'${errorMessage}';
    }
  },
);

//////////////////////////////////////
//default textButton
Widget defaultTextButton({
 required VoidCallback function,
  required String text,
})=>TextButton(
  onPressed:function,
  child:Text('${text}',
    style: TextStyle(
      fontSize: 18,
      color: AppColor.primaryColor,
    ),
  ) ,
);
/////////////////////////////////////
//default Button
Widget defaultButton({
  required VoidCallback function,
  required String text,
})=>Container(
  height: 50,
  width:double.infinity,
  decoration: BoxDecoration(
    color:AppColor.primaryColor,
    borderRadius: BorderRadius.circular(10),
  ),
  child: InkWell(
    child: Center(
      child: Text('${text}',
        style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily:AppStrings.appFont
        ),
      ),
    ),
    onTap:function
  ),
);