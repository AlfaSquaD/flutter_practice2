import 'package:flutter/material.dart';

topSectionHeight(int mediaHeight) => mediaHeight / 3.2;

final ThemeData normalTheme = ThemeData(
    primaryColor: Colors.lightGreen,
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(100, 50)),
            elevation: MaterialStateProperty.all(5),
            backgroundColor: MaterialStateProperty.all(Colors.lightGreen))),
    primaryTextTheme: TextTheme(
        caption:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white)),
        filled: true,
        labelStyle: TextStyle(color: Colors.black87),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.green.shade700, width: 3))));
