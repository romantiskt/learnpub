import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_day_flutter/core/color.dart';
import 'package:one_day_flutter/page/home/add/type/type_add_page.dart';

class TypeSettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TypeSettingState();
  }
}

class ShareDataWidget extends InheritedWidget{
  ShareDataWidget({
    @required this.data,
    Widget child
  }) :super(child: child);

  final int data; //需要在子树中共享的数据，保存点击次数

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return old.data != data;
  }

}
class TypeSettingState extends State<TypeSettingPage> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.themeColor,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                  width: 100,
                  height: 28,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
                  alignment: Alignment.center,
                  decoration: selectIndex == 0
                      ? BoxDecoration(
                          color: AppColor.black,
                          borderRadius:
                              BorderRadius.horizontal(left: Radius.circular(4)))
                      : BoxDecoration(
                          color: AppColor.themeColor,
                          border: Border.all(color: AppColor.black, width: 0.5),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(4))),
                  child: Text(
                    "支出",
                    style: TextStyle(
                        color: selectIndex == 0
                            ? AppColor.themeColor
                            : AppColor.black),
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectIndex = 0;
                  });
                },
              ),
              InkWell(
                child: Container(
                    width: 100,
                    height: 28,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
                    alignment: Alignment.center,
                    decoration: selectIndex == 1
                        ? BoxDecoration(
                            color: AppColor.black,
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(4)))
                        : BoxDecoration(
                            color: AppColor.themeColor,
                            border:
                                Border.all(color: AppColor.black, width: 0.5),
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(4))),
                    child: Text(
                      "收入",
                      style: TextStyle(
                          color: selectIndex == 1
                              ? AppColor.themeColor
                              : AppColor.black),
                    )),
                onTap: () {
                  setState(() {
                    selectIndex = 1;
                  });
                },
              )
            ],
          ),
        ),
        iconTheme: IconThemeData(color: AppColor.black),
        title: Text(
          "类别设置",
          style: TextStyle(
              color: AppColor.black, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: ShareDataWidget(
        data: selectIndex,
        child: TypeAddPage(),),
    );
  }
}
