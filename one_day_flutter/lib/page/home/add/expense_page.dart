import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_day_flutter/config/application.dart';
import 'package:one_day_flutter/config/routes.dart';
import 'package:one_day_flutter/core/device.dart';
import 'package:one_day_flutter/page/home/add/expense_data.dart';

class ExpensePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExpenseState();
  }
}

class ExpenseState extends State<ExpensePage> {
  ExpenseModel model = new ExpenseModel();
  int selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, //横轴三个子widget
            childAspectRatio: 1.0),
        children: getContentView(),
      ), //宽高比为1时，子widget
    );
  }

  List<Widget> getContentView() {
    return model.expenseList.asMap().keys.map((e) => getItemView(e)).toList();
  }

  Widget getItemView(int e) {
    var expenseItem = model.expenseList[e];
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              width: Device.screenWidth / 4 - 50,
              image: selectIndex == e
                  ? AssetImage(expenseItem.activeIcon)
                  : AssetImage(expenseItem.normalIcon)),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
            child: Text("${expenseItem.name}"),
          )
        ],
      ),
      onTap: () {
        setState(() {
          if(expenseItem.isSetting){
            Application.router.navigateTo(context, Routes.typeSetting,transition: TransitionType.inFromRight);
          }else{
            selectIndex = e;
          }

        });
      },
    );
  }
}
