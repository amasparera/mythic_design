import 'package:flutter/material.dart';
import 'package:mythic_design/common/thema_app.dart';
import 'package:mythic_design/presentation/page/home_page.dart';

import 'route_name.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: thmeaSiang(),
        // navigatorObservers: [routeObserver],
        initialRoute: HomePage.route,
        onGenerateRoute: navigasi);
  }
}
