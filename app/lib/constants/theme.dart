import 'package:chouxcream_app/utils/graphic/color.dart' as color;
import 'package:flutter/material.dart';

class ThemeConstant {
  // Colors
  static Color colorPrimary = const Color(0xFFE07D12);
  static Color colorSecondaryLight = const Color(0xFFFFE047);
  static Color colorSecondaryDark = const Color(0xFFFFCE1F);
  static Color colorAccentLight = const Color(0xFFA1C181);
  static Color colorAccentDark = const Color(0xFF619B8A);

  // Color swatch
  static MaterialColor swatchPrimary = color.createMaterialColor(colorPrimary);
  static MaterialColor swatchSecondaryLight = color.createMaterialColor(colorSecondaryLight);
  static MaterialColor swatchSecondaryDark = color.createMaterialColor(colorSecondaryDark);
  static MaterialColor swatchAccentLight = color.createMaterialColor(colorAccentLight);
  static MaterialColor swatchAccentDark = color.createMaterialColor(colorAccentDark);

  // Shape
  static RoundedRectangleBorder philBorderShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(99999.0));

  // Theme data
  static ThemeData theme = ThemeData(
    primarySwatch: swatchPrimary,
    buttonTheme: ButtonThemeData(shape: philBorderShape),
  );
}
