

import 'package:flutter/painting.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:one_day_flutter/page/home/main_page.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext
    context, Map<String, List<String>> params) {
      return MainTabPage();
    });