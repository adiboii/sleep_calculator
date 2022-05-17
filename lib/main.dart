import 'package:flutter/material.dart';
import 'package:sleep_calculator/InputOne.dart';
import 'package:sleep_calculator/ResultsPage.dart';
import 'package:sleep_calculator/home.dart';
import 'package:sleep_calculator/themes/AppTheme.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'InputTwo.dart';

void main() {
  runApp(MaterialApp(
    title: 'Slep Teim',
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    theme: AppThemeData,
    routes: {
      '/inputOne': (context) => InputOne(),
      '/inputTwo': (context) => InputTwo(),
      '/resultPage': (context) => ResultPage(),
    },
  ));
}
