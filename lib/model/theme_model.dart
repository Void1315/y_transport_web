import 'package:flutter/material.dart';

class ThemeModel {
  ThemeData themeData;
  ThemeModel({
    this.themeData,
  });
  ThemeModel.lightTheme() {
    themeData = new ThemeData.from(
        colorScheme: ColorScheme.light(primary: Color(0xFF36CFC9)));
  }
}
