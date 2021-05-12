import 'package:flutter/material.dart';
import 'package:one_day_flutter/config/application.dart';

class Device {
   static double screenWidth;

  static init() {
    screenWidth = MediaQuery.of(Application.context).size.width;
    print("宽度：${screenWidth}");
  }
}
