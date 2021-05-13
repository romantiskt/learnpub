import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_day_flutter/core/color.dart';

import '../../main.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = List();
    var i = 100;
    while (i < 100) {
      list[i] = Text("hellohellohellohellohellohellohellohellohellohellohellohellohellohellohello");
    }
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("明细", textScaleFactor: 5),
      ),
      appBar: AppBar(
          title: new Center(
            child: Text(
              "首页",
              style: TextStyle(color: Color(0xFF000000)),
            ),
          ),
          backgroundColor: AppColor.white,
          automaticallyImplyLeading: false),
    );
  }
}
