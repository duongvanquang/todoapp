import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'todo_colors_theme.dart';

mixin TodoTheme {
  static ThemeData buildTheme() => ThemeData(
      fontFamily: 'rubik',
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: TodoColorsTheme.blueColor,
              statusBarBrightness: Brightness.light)),
      textTheme: const TextTheme(
          headline1: TextStyle(
            color: TodoColorsTheme.primaryBlack,
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
          headline2: TextStyle(
            color: TodoColorsTheme.primaryBlack,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          headline3: TextStyle(
            color: TodoColorsTheme.primaryBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          headline4: TextStyle(
            color: TodoColorsTheme.primaryBlack,
            fontSize: 17,
          ),
          headline5: TextStyle(
            color: TodoColorsTheme.primaryBlack,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          headline6: TextStyle(
            color: TodoColorsTheme.primaryBlack,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          bodyText1: TextStyle(
            color: TodoColorsTheme.primaryBlack,
            height: 1.75,
            fontSize: 11,
          ),
          bodyText2: TextStyle(
            color: TodoColorsTheme.primaryBlack,
            fontSize: 10,
          ),
          button: TextStyle(
            color: TodoColorsTheme.primaryBlack,
            fontSize: 8,
          )));
}
