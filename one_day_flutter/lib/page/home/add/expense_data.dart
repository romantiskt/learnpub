class ExpenseModel {
  List<IconEntity> expenseList;
  List<IconEntity> incomeList;

  ExpenseModel() {
    incomeList=[
      IconEntity("工资", "assets/image/charge/category_i_wage_selected.png", "assets/image/charge/category_i_wage_normal.png"),
      IconEntity("兼职", "assets/image/charge/category_i_parttimework_selected.png", "assets/image/charge/category_i_parttimework_normal.png"),
      IconEntity("理财", "assets/image/charge/category_i_finance_selected.png", "assets/image/charge/category_i_finance_normal.png"),
      IconEntity("礼金", "assets/image/charge/category_i_money_selected.png", "assets/image/charge/category_i_money_normal.png"),
      IconEntity("其它", "assets/image/charge/category_i_other_selected.png", "assets/image/charge/category_i_other_normal.png"),
      IconEntity("设置", "assets/image/charge/tallytype_set.png", "assets/image/charge/tallytype_set.png",isSetting: true),
    ];
    expenseList = [
      IconEntity("美容", "assets/image/charge/category_e_beauty_selected.png", "assets/image/charge/category_e_beauty_normal.png"),
      IconEntity("书籍", "assets/image/charge/category_e_books_selected.png", "assets/image/charge/category_e_books_normal.png"),
      IconEntity("汽车", "assets/image/charge/category_e_car_selected.png", "assets/image/charge/category_e_car_normal.png"),
      IconEntity("餐饮", "assets/image/charge/category_e_catering_selected.png", "assets/image/charge/category_e_catering_normal.png"),
      IconEntity("小孩", "assets/image/charge/category_e_child_selected.png", "assets/image/charge/category_e_child_normal.png"),
      IconEntity("日用", "assets/image/charge/category_e_commodity_selected.png", "assets/image/charge/category_e_commodity_normal.png"),
      IconEntity("通讯", "assets/image/charge/category_e_communicate_selected.png", "assets/image/charge/category_e_communicate_normal.png"),
      IconEntity("数码", "assets/image/charge/category_e_digital_selected.png", "assets/image/charge/category_e_digital_normal.png"),
      IconEntity("捐赠", "assets/image/charge/category_e_donate_selected.png", "assets/image/charge/category_e_donate_normal.png"),
      IconEntity("服饰", "assets/image/charge/category_e_dress_selected.png", "assets/image/charge/category_e_dress_normal.png"),
      IconEntity("长辈", "assets/image/charge/category_e_elder_selected.png", "assets/image/charge/category_e_elder_normal.png"),
      IconEntity("娱乐", "assets/image/charge/category_e_entertainmente_selected.png", "assets/image/charge/category_e_entertainmente_normal.png"),
      IconEntity("快递", "assets/image/charge/category_e_express_selected.png", "assets/image/charge/category_e_express_normal.png"),
      IconEntity("亲友", "assets/image/charge/category_e_friend_selected.png", "assets/image/charge/category_e_friend_normal.png"),
      IconEntity("水果", "assets/image/charge/category_e_fruite_selected.png", "assets/image/charge/category_e_fruite_normal.png"),
      IconEntity("礼物", "assets/image/charge/category_e_gift_selected.png", "assets/image/charge/category_e_gift_normal.png"),
      IconEntity("居家", "assets/image/charge/category_e_home_selected.png", "assets/image/charge/category_e_home_normal.png"),
      IconEntity("住房", "assets/image/charge/category_e_house_selected.png", "assets/image/charge/category_e_house_normal.png"),
      IconEntity("彩票", "assets/image/charge/category_e_lottery_selected.png", "assets/image/charge/category_e_lottery_normal.png"),
      IconEntity("医疗", "assets/image/charge/category_e_medical_selected.png", "assets/image/charge/category_e_medical_normal.png"),
      IconEntity("礼金", "assets/image/charge/category_e_money_selected.png", "assets/image/charge/category_e_money_normal.png"),
      IconEntity("办公", "assets/image/charge/category_e_office_selected.png", "assets/image/charge/category_e_office_normal.png"),
      IconEntity("宠物", "assets/image/charge/category_e_pet_selected.png", "assets/image/charge/category_e_pet_normal.png"),
      IconEntity("维修", "assets/image/charge/category_e_repair_selected.png", "assets/image/charge/category_e_repair_normal.png"),
      IconEntity("购物", "assets/image/charge/category_e_shopping_selected.png", "assets/image/charge/category_e_shopping_normal.png"),
      IconEntity("烟酒", "assets/image/charge/category_e_smoke_selected.png", "assets/image/charge/category_e_smoke_normal.png"),
      IconEntity("零食", "assets/image/charge/category_e_snack_selected.png", "assets/image/charge/category_e_snack_normal.png"),
      IconEntity("社交", "assets/image/charge/category_e_social_selected.png", "assets/image/charge/category_e_social_normal.png"),
      IconEntity("运动", "assets/image/charge/category_e_sport_selected.png", "assets/image/charge/category_e_sport_normal.png"),
      IconEntity("学习", "assets/image/charge/category_e_study_selected.png", "assets/image/charge/category_e_study_normal.png"),
      IconEntity("交通", "assets/image/charge/category_e_traffic_selected.png", "assets/image/charge/category_e_traffic_normal.png"),
      IconEntity("旅行", "assets/image/charge/category_e_travel_selected.png", "assets/image/charge/category_e_travel_normal.png"),
      IconEntity("蔬菜", "assets/image/charge/category_e_vegetable_selected.png", "assets/image/charge/category_e_vegetable_normal.png"),
      IconEntity("设置", "assets/image/charge/tallytype_set.png", "assets/image/charge/tallytype_set.png",isSetting: true),
    ];
  }
}

class IconEntity {
  String name, activeIcon, normalIcon;

  bool isSetting=false;

  IconEntity(this.name, this.activeIcon, this.normalIcon, {this.isSetting=false});
}
