import 'package:flutter/material.dart';
import 'package:myenglish/controllers/sesions.controller.dart';
import 'package:myenglish/utils/my_colors.dart';

Widget lastNameInput(SessionController cont) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
    decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30.0)),
    child: TextField(
      controller: cont.lastNameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Apellidos(s)',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15.0),
          prefixIcon: Icon(
            Icons.person_outline,
            color: MyColors.primaryColor,
          ),
          hintStyle: TextStyle(color: MyColors.primaryColorDark)),
    ),
  );
}
