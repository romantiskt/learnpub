import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_day_flutter/core/color.dart';
import 'package:one_day_flutter/system/fixed_tabindicator.dart';

class ChargePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ChargePageState();
  }
}

class ChargePageState extends State<ChargePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["   支出   ", "   收入   "];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: Offstage(child: AppBar(
        backgroundColor: AppColor.themeColor,
        bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            indicator: FixedWidthTabIndicator(
                width: 70,
                borderSide: BorderSide(width: 2.0, color: Colors.black)),
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),offstage: false,),),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
    );
  }
}
