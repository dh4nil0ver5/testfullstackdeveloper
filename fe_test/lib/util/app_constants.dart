import 'package:flutter/material.dart';

class AppConstant {
  static double width_screen = 0.0;
  static double height_screen = 0.0;
  static double btnWidth = 0.0;
  static double btnHeight = 0.0;
  
  static void initialize(BuildContext context) {
    width_screen = MediaQuery.of(context).size.width; 
    height_screen = MediaQuery.of(context).size.height; 
    btnWidth = MediaQuery.of(context).size.width*0.7;
    btnHeight = MediaQuery.of(context).size.height*0.05;
  }
  // 
}