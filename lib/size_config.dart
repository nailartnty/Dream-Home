import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData  _mediaQueryData = 
  MediaQueryData.fromView(
    // ignore: deprecated_member_use
    WidgetsBinding.instance.window
  );
  
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double defaultSize = 0.0;

// context merepresentasikan screen yg aktif
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

  }
}


// fuction that used to get the proportionate height size of the screen
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812.0 itu tinggi layout yg umum digunakan oleh programmer
  return (inputHeight / 812.0)* screenHeight;
}

double getProportionateScreenW(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 812.0 itu lebar layout yg umum digunakan oleh programmer
  return (inputWidth / 375.0)* screenWidth;
}