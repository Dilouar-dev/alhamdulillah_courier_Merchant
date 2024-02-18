import 'package:flutter/material.dart';

class Colormanager {
  //FE3000
  static Color primary = Colors.teal;
  // static Color primary = const Color.fromARGB(255, 145, 180, 88);
  static Color darkGrey = HexColor.fromHex('#525252');
  static Color grey = HexColor.fromHex('#737477');
  static Color lightGrey = HexColor.fromHex('#9E9E9E');
  static Color primaryOpacity70 = HexColor.fromHex('#151B54');
  static Color dd = const Color.fromARGB(255, 240, 139, 117);
  static Color fillcolor = const Color(0xfff3f3f4);

  static Color black54 = Colors.black54;
  static Color black = Colors.black;
  static Color red = Colors.red;
  static Color success = const Color.fromARGB(255, 20, 89, 56);
  static Color darkblue = const Color.fromARGB(255, 46, 106, 78);//
  static Color d1 = const Color.fromARGB(255, 46, 106, 78);
  static Color d2 = const Color.fromARGB(255, 151, 66, 95);
  static Color d3 = Color(0xffAF7824);//Color(0xffB7050A);//const Color.fromARGB(255, 47, 69, 113);
  static Color d4 = const Color.fromARGB(255, 96, 41, 100);

  // New Colors
  static Color darkPrimary = Color(0xffAF7824);//Color(0xffB7050A);//HexColor.fromHex('#151B54');
  //static Color darkPrimary = const Color.fromARGB(255, 82, 105, 44);
  static Color grey1 = HexColor.fromHex('#707070');
  static Color grey2 = HexColor.fromHex('#797979');
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color error = HexColor.fromHex('#e61f34'); //Red Color
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}



