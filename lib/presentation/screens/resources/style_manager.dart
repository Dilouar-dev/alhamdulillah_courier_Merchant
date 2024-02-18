

import 'package:flutter/material.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';


// Text Style
TextStyle _getTextStyle(
    {required double fontSize,
    required String fontFamily,
    required FontWeight fontWeight,
    required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color);
}

//Reqular Text Style
TextStyle getRegularStyle(
    {double fontSize = AppSize.s12, required Color color,TextDecoration textDecoration=TextDecoration.none}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstant.fontFamily,
      fontWeight: FontWeightManager.regular,
      color: color);
}

//Light Text Style
TextStyle getLightStyle({double fontSize = AppSize.s12, required Color color,TextDecoration textDecoration=TextDecoration.none}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstant.fontFamily,
      fontWeight: FontWeightManager.light,
      color: color);
}

//Medium Text Style
TextStyle getMediumStyle(
    {double fontSize = AppSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstant.fontFamily,
      fontWeight: FontWeightManager.medium,
      color: color);
}

//Bold Text Style
TextStyle getBoldStyle({double fontSize = AppSize.s12, required Color color,TextDecoration textDecoration=TextDecoration.none}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstant.fontFamily,
      fontWeight: FontWeightManager.bold,
      color: color);
}

//SemiBold Text Style
TextStyle getSemiBoldStyle(
    {double fontSize = AppSize.s12, required Color color,TextDecoration textDecoration=TextDecoration.none}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstant.fontFamily,
      fontWeight: FontWeightManager.semiBold,
      color: color);
}
