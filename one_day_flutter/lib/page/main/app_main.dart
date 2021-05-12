import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:one_day_flutter/config/application.dart';
import 'package:one_day_flutter/config/routes.dart';
import 'package:one_day_flutter/core/device.dart';

class AppMainPage extends StatefulWidget {
  @override
  AppMainPageState createState() => AppMainPageState();
}

class AppMainPageState extends State<AppMainPage> {
  AppMainPageState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'Fluro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router.generator,
    );
//    print("initial route = ${app.initialRoute}");
    return app;
  }
}
