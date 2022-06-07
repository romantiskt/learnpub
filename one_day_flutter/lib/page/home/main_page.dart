import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_day_flutter/config/application.dart';
import 'package:one_day_flutter/config/routes.dart';
import 'package:one_day_flutter/core/channel/log_channel.dart';
import 'package:one_day_flutter/core/device.dart';
import 'package:one_day_flutter/page/home/chart_page.dart';
import 'package:one_day_flutter/page/home/me_page.dart';
import 'package:one_day_flutter/page/home/sns_page.dart';
import 'package:one_day_flutter/page/home/tab/main_tab.dart';

import 'detail_page.dart';

class MainTabPage extends StatefulWidget {
  final String title;

  const MainTabPage({Key key, this.title}) : super(key: key);

  @override
  _MainTabPageState createState() {
    return _MainTabPageState();
  }
}

class _MainTabPageState extends State<MainTabPage> {
  List<Widget> pages = [DetailPage(), ChartPage(), Container(),SnsPage(), MePage()];
  int _selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    Application.context = context;
    Device.init();
    return Scaffold(body: Container(
        color: Color.fromARGB(255, 248, 248, 248),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              child: new IndexedStack(
                children: pages,
                index: _selectIndex,
              ),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
            ),
            MainTabView(tabCallBack: tabClick,)
          ],
        )),);
  }

  void tabClick(int index){
    LogUtils.d("wang","点击tab了。。。$index");
    if(index==2){
      Application.router.navigateTo(context, Routes.add, transition: TransitionType.inFromBottom);
    }else{
      setState(() {
        _selectIndex=index;
      });
    }

  }

  @override
  void initState() {
    super.initState();
  }
}
