import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_day_flutter/core/color.dart';

typedef TabCallBack =void Function(int index);

class MainTabView extends StatefulWidget {
  final TabCallBack tabCallBack;

  MainTabView({ this.tabCallBack});

  @override
  State<StatefulWidget> createState() {
    return new MainTabState( tabCallBack: tabCallBack);
  }
}

class _Item {
  String name, activeIcon, normalIcon;
  int pos;

  _Item(this.name, this.activeIcon, this.normalIcon, this.pos);
}

class MainTabState extends State<MainTabView> {
  final itemNames = [
    _Item('明细', 'assets/image/home/bottom_detail_pressed.png',
        'assets/image/home/bottom_detail_normal.png', 0),
    _Item('图表', 'assets/image/home/bottom_chart_pressed.png',
        'assets/image/home/bottom_chart_normal.png', 1),
    _Item('记账', 'assets/image/home/bottom_add_pressed.png',
        'assets/image/home/bottom_add_normal.png', 2),
    _Item('社区', 'assets/image/home/bottom_sns_pressed.png',
        'assets/image/home/bottom_sns_normal.png', 3),
    _Item('我的', 'assets/image/home/bottom_me_pressed.png',
        'assets/image/home/bottom_me_normal.png', 4),
  ];
  double screenWidth;
  int selectIndex=0;
  TabCallBack tabCallBack;

  MainTabState({this.tabCallBack});

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
        height: 80,
        color: Colors.white12,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              child: Row(children: tabItem()),
              height: 60,
              color: Colors.white,
            ),
            buildCenterButton()
          ],
        ));
  }

  Widget buildCenterButton() {
    return InkWell(
      onTap: () {
        doCenterClick();
      },
      child: Container(
          width: screenWidth / 5,
          child: Column(
            children: [
              Image(
                  height: 55, image: AssetImage(itemNames[2].normalIcon)),
              Text(
                itemNames[2].name,
                style: TextStyle(fontSize: 11, color: Colors.black87),
              )
            ],
          )),);
  }

  tabItem() {
    return itemNames
        .asMap()
        .keys
        .map((e) => getItemContainer(e))
        .toList();
  }

  Widget getItemContainer(int e) {
    if (e == 2) {
      return new Container(width: screenWidth / 5, child: Text(""));
    } else {
      return new InkWell(
        onTap: () {
          doTabItemClick(e);
        },
        child: Container(
          width: screenWidth / 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(height: 25,
                  image: selectIndex == e
                      ? AssetImage(itemNames[e].activeIcon)
                      : AssetImage(itemNames[e].normalIcon)),
              Text(
                itemNames[e].name,
                style: TextStyle(
                    fontSize: 11,
                    color: selectIndex == e ? AppColor.themeColor : Colors.black),
              )
            ],
          ),
        ),
      );
    }
  }

  doTabItemClick(int e) {
    tabCallBack(e);
    setState(() {
      selectIndex = e;
    });

  }

  void doCenterClick() {
    tabCallBack(2);
  }
}
