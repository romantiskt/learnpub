import 'package:flutter/material.dart';
import 'package:one_day_flutter/core/color.dart';
import 'package:one_day_flutter/page/home/add/type/type_setting_page.dart';

import '../expense_data.dart';

class TypeAddPage extends StatefulWidget {

  TypeAddPage();

  @override
  State<StatefulWidget> createState() {
    return TypeAddState();
  }
}

class TypeAddState extends State<TypeAddPage> {
  ExpenseModel model = new ExpenseModel();

  TypeAddState();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getContentWidget(),
    );
  }

  List<Widget> getContentWidget() {
    if(ShareDataWidget.of(context).data==0){
      return model.expenseList.asMap().keys.map((e) => getItemView(e)).toList();
    }else{
      return model.incomeList.asMap().keys.map((e) => getItemView(e)).toList();
    }

  }

  Widget getItemView(int e) {
    var entity = ShareDataWidget.of(context).data==0?model.expenseList[e]:model.incomeList[e];
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Stack(
            children: [
              Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                        width: 20,
                        height: 20,
                        image: AssetImage(
                            "assets/image/charge/ucrop_ic_delete_photo.png")),
                    Container(
                      child: Image(
                          width: 35,
                          height: 35,
                          image: AssetImage(entity.normalIcon)),
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    ),
                    Container(
                      child: Text(entity.name),
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Image(
                    width: 20,
                    height: 20,
                    image: AssetImage(
                        "assets/image/charge/ic_item_third_bar.png")),
              )
            ],
          ),
          height: 50,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
          color: AppColor.black12,
          height: 0.5,
        )
      ],
    );
  }
}
