import 'package:flutter/material.dart';

ButtonStyle ElevatedButtonStyle =
    ElevatedButton.styleFrom(primary: Colors.purple, fixedSize: Size(10, 10));

class AppTextStyle {

  static TextStyle title() =>
      TextStyle(
        color: Color.fromARGB(255, 35, 192, 184),
        fontSize: 30,
        fontWeight: FontWeight.w600,
        fontFamily: "Cairo",
      );

  static TextStyle Heading1() =>
      TextStyle(
        color: Color.fromARGB(255, 35, 192, 184),
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: "Cairo",
      );

  static TextStyle Heading2() =>
      TextStyle(
        color: Colors.blueGrey,
        fontSize: 17,
        fontWeight: FontWeight.w600,
        fontFamily: "Cairo",
      );

}