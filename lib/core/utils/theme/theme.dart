
import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

ThemeData appTheme = ThemeData(

  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: 50
    ),
    displayMedium:TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 15
    ),
    displaySmall: TextStyle(
      color: Colors.grey,

      fontSize: 17
  ),

  ),

  inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent
        ),
        borderRadius: BorderRadius.only(
            topLeft:
            Radius.circular(1000),
            bottomLeft:
            Radius.circular(1000)),
      ),

      ),

  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.square(50),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(200),
                bottomRight: Radius.circular(200),
              )),
          backgroundColor: kOrangeColor)
  )

);