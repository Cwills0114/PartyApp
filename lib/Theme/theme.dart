import 'package:flutter/material.dart';

ThemeData standardTheme() {
  TextTheme standardTextTheme(TextTheme base) {
    return base.copyWith(
        headline6: base.headline6.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 100.0,
            fontFamily: "OpenSans"),
        headline5: base.headline5.copyWith(
            color: Colors.green,
            fontWeight: FontWeight.w400,
            fontSize: 75.0,
            fontFamily: "OpenSans"));
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: standardTextTheme(base.textTheme),
    primaryColor: Color.fromARGB(100, 246, 202, 81),
  );
}
