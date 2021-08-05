import 'package:flutter/material.dart';
import 'package:todo_task/constants/colors.dart';

class CustomTextForm extends StatelessWidget {
  late final TextEditingController? controller;
  final String label;
  final String validMessage;

  CustomTextForm({ this.controller,required this.label,required this.validMessage,}) ;

  final OutlineInputBorder borderE = OutlineInputBorder(
    borderSide: BorderSide(
      color: primary200Color,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(50),
  );

  final OutlineInputBorder borderF = OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: primaryColor,
    ),
    borderRadius: BorderRadius.circular(50),
  );

  final TextStyle _labelStyle = TextStyle(color: blackColor, inherit: true);

  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      minLines: 1,
      keyboardType: TextInputType.multiline,
      controller: controller,
      style: TextStyle(
        color: blackColor,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: _labelStyle,
        prefixIcon: Icon(
          Icons.rate_review,
          color: primaryColor,
        ),
        fillColor: Colors.white,
        focusedBorder: borderF,
        enabledBorder: borderE,
        border: borderE,
        filled: true,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validMessage;
        } else {
          return null;
        }
      },
    );
  }
}
