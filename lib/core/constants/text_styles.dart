import 'package:flutter/material.dart';

import 'colors.dart';

class TextStyles {
  final Color color;
  TextStyles({this.color = ColorStyles.whiteColor});

  TextStyle get h1 => TextStyle(
        fontFamily: "Ubuntu",
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: color,
      );

  TextStyle get h1Bold => TextStyle(
        color: color,
        fontFamily: 'Ubuntu',
        fontSize: 64,
        fontWeight: FontWeight.bold,
      );

  TextStyle get b1 => TextStyle(
        fontFamily: "Roboto",
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: color,
      );
  TextStyle get b1Medium => TextStyle(
        fontFamily: "Roboto",
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: color,
      );
  TextStyle get b2 => TextStyle(
        fontFamily: "Roboto",
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: color,
      );
  TextStyle get b2Medium => TextStyle(
        fontFamily: "Roboto",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: color,
      );
}
