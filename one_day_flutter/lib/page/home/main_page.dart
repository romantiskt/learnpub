import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_day_flutter/page/home/add_page.dart';
import 'package:one_day_flutter/page/home/chart_page.dart';
import 'package:one_day_flutter/page/home/me_page.dart';
import 'package:one_day_flutter/page/home/sns_page.dart';

import 'detail_page.dart';

class MainTabPage extends StatefulWidget {
  final String title;

  const MainTabPage({Key key, this.title}) : super(key: key);

  @override
  _MainTabPageState createState() {
    return _MainTabPageState();
  }
}

class _Item {
  String name, activeIcon, normalIcon;
  int pos;

  _Item(this.name, this.activeIcon, this.normalIcon, this.pos);
}

class _MainTabPageState extends State<MainTabPage> {
  List<Widget> pages;
  int _selectIndex = 0;
  final itemNames = [
    _Item('明细', 'assets/image/bottom_detail_pressed.png',
        'assets/image/bottom_detail_normal.png', 0),
    _Item('图表', 'assets/image/bottom_chart_pressed.png',
        'assets/image/bottom_chart_normal.png', 1),
    _Item('记账', 'assets/image/bottom_add_pressed.png',
        'assets/image/bottom_add_normal.png', 2),
    _Item('社区', 'assets/image/bottom_sns_pressed.png',
        'assets/image/bottom_sns_normal.png', 3),
    _Item('我的', 'assets/image/bottom_me_pressed.png',
        'assets/image/bottom_me_normal.png', 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new IndexedStack(
        children: pages,
        index: _selectIndex,
      ),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
          });
        },
        //图标大小
        iconSize: 24,
        //当前选中的索引
        currentIndex: _selectIndex,
        //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
        fixedColor: Color.fromARGB(255, 255, 110, 52),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  List<BottomNavigationBarItem> itemList;

  @override
  void initState() {
    super.initState();
    if (pages == null) {
      pages = [DetailPage(), ChartPage(), AddPage(), SnsPage(),MePage()];
    }
    if (itemList == null) {
      itemList = itemNames
          .map((item) => BottomNavigationBarItem(
              icon: Image.asset(
                item.normalIcon,
                width: 30.0,
                height: 30.0,
              ),
              title: Text(
                item.name,
                style: TextStyle(fontSize: 10.0),
              ),
              activeIcon:
                  Image.asset(item.activeIcon, width: 30.0, height: 30.0)))
          .toList();
    }
  }
}
