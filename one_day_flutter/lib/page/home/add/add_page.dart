import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_day_flutter/config/application.dart';
import 'package:one_day_flutter/core/color.dart';
import 'package:one_day_flutter/system/fixed_tabindicator.dart';

import 'expense_page.dart';
import 'income_page.dart';

class ChargePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ChargePageState();
  }
}

class ChargePageState extends State<ChargePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["支出", "收入"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Offstage(
          child: Stack(
            children: [
              AppBar(
                backgroundColor: AppColor.themeColor,
                bottom: TabBar(
                    isScrollable: true,
                    labelColor: Colors.black,
                    labelPadding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    indicatorColor: Colors.black,
                    indicator: FixedWidthTabIndicator(
                        width: 70,
                        borderSide:
                            BorderSide(width: 2.0, color: Colors.black)),
                    labelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    controller: _tabController,
                    tabs: tabs.map((e) => Tab(text: e)).toList()),
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.fromLTRB(0, 0, 16, 16),
                child: InkWell(
                  child: Text(
                    "取消",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight:FontWeight.normal,color: AppColor.black87),
                  ),
                  onTap: () => {Application.router.pop(context)},
                ),
              )
            ],
          ),
          offstage: false,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.asMap().keys.map((e) => addTabContainer(e)).toList(),
      ),
    );
  }

  Widget addTabContainer(int e) {
    return e == 0 ? ExpensePage() : IncomePage();
  }
}
