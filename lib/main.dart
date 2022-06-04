import 'package:flutter/material.dart';
import 'package:mythic_design/common/thema_app.dart';
import 'package:mythic_design/presentation/page/home_page.dart';
import 'package:mythic_design/presentation/provider/home_profider.dart';
import 'package:provider/provider.dart';

import 'injection.dart' as di;

import 'route_name.dart';

void main(List<String> args) {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.locator<HomeNotifier>()),
      ],
      child: MaterialApp(
          theme: thmeaSiang(),
          // navigatorObservers: [routeObserver],
          initialRoute: HomePage.route,
          onGenerateRoute: navigasi),
    );
  }
}
