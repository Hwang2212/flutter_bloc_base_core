import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_base/gen/colors.gen.dart';

import 'app_fonts.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily, Color color,
    FontWeight fontWeight, FontStyle fontStyle) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle);
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s14,
    Color color = ColorName.black,
    FontStyle fontStyle = FontStyle.normal}) {
  return _getTextStyle(fontSize, AppFonts.fontFamily, color,
      FontWeightManager.regular, fontStyle);
}

TextStyle getLightStyle(
    {double fontSize = FontSize.s14,
    Color color = ColorName.black,
    FontStyle fontStyle = FontStyle.normal}) {
  return _getTextStyle(
      fontSize, AppFonts.fontFamily, color, FontWeightManager.light, fontStyle);
}

TextStyle getExtraMoreLightStyle(
    {double fontSize = FontSize.s14,
    Color color = ColorName.black,
    FontWeight fontWeight = FontWeightManager.extraMoreLight,
    FontStyle fontStyle = FontStyle.normal}) {
  return _getTextStyle(
      fontSize, AppFonts.fontFamily, color, fontWeight, fontStyle);
}

TextStyle getExtraLightStyle(
    {double fontSize = FontSize.s14,
    Color color = ColorName.black,
    FontStyle fontStyle = FontStyle.normal}) {
  return _getTextStyle(fontSize, AppFonts.fontFamily, color,
      FontWeightManager.extraLight, fontStyle);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s14,
    Color color = ColorName.black,
    FontStyle fontStyle = FontStyle.normal}) {
  return _getTextStyle(fontSize, AppFonts.fontFamily, color,
      FontWeightManager.medium, fontStyle);
}

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s14,
    Color color = ColorName.black,
    FontStyle fontStyle = FontStyle.normal}) {
  return _getTextStyle(fontSize, AppFonts.fontFamily, color,
      FontWeightManager.semiBold, fontStyle);
}

TextStyle getBoldStyle(
    {double fontSize = FontSize.s14,
    Color color = ColorName.black,
    FontStyle fontStyle = FontStyle.normal}) {
  return _getTextStyle(
      fontSize, AppFonts.fontFamily, color, FontWeightManager.bold, fontStyle);
}

TextStyle getExtraBoldStyle(
    {double fontSize = FontSize.s14,
    Color color = ColorName.black,
    FontStyle fontStyle = FontStyle.normal}) {
  return _getTextStyle(fontSize, AppFonts.fontFamily, color,
      FontWeightManager.extraBold, fontStyle);
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
