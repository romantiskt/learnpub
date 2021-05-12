import 'package:flutter/material.dart';
import 'package:one_day_flutter/core/color.dart';

import '../expense_data.dart';

class TypeAddPage extends StatefulWidget {
  int type;

  TypeAddPage(this.type);

  @override
  State<StatefulWidget> createState() {
    return TypeAddState(type);
  }
}

class TypeAddState extends State<TypeAddPage> {
  int type;
  ExpenseModel model = new ExpenseModel();

  TypeAddState(this.type);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getContentWidget(),
    );
  }

  List<Widget> getContentWidget() {
    if(type==0){
      return model.expenseList.asMap().keys.map((e) => getItemView(e)).toList();
    }else{
      return model.incomeList.asMap().keys.map((e) => getItemView(e)).toList();
    }

  }

  Widget getItemView(int e) {
    var entity = model.expenseList[e];
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
