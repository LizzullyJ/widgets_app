import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.purple,
  Colors.pink,
  Colors.cyanAccent,
  Colors.blueGrey,
  Colors.orange,
  Colors.red,
  Colors.lime,
  Colors.indigo,
  Colors.lightGreen,
  Colors.yellow
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  })  : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length,
            'Selectected color must be less or than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: false),
      );
}
