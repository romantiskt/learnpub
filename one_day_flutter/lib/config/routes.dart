import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String add = "/add";
  static String typeSetting = "/add/setting";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(root, handler: rootHandler);
    router.define(add, handler: addHandler);
    router.define(typeSetting, handler: typeSettingHandler);
  }
}
