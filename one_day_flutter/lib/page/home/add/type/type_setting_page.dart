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
      body: selectIndex==0?TypeAddPage(0):TypeAddPage(1),
    );
  }
}
