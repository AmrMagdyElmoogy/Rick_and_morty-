import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String baseUrl = 'https://rickandmortyapi.com/api/';
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: hexToColor('#1B1B25'),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontFamily: 'Nutio',
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
    headline2: TextStyle(
      fontFamily: 'Nutio',
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w800,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: hexToColor('#1B1B25'),
    textTheme: TextTheme(
      headline3: TextStyle(
        fontFamily: 'Nutio',
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
    ),
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: hexToColor('#1B1B25'),
    ),
    backwardsCompatibility: false,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: hexToColor('#1B1B25'),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    showUnselectedLabels: false,
  ),
);
