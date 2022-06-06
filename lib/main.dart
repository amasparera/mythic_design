import 'package:flutter/material.dart';
import 'package:mythic_design/common/thema_app.dart';
import 'package:mythic_design/presentation/page/login_page.dart';
import 'package:provider/provider.dart';

import 'injection.dart' as di;

import 'presentation/provider/detail_product_nothifier.dart';
import 'presentation/provider/home_nothifier.dart';
import 'presentation/provider/login_nothifier.dart';
import 'presentation/provider/profile_nothifier.dart';
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
        ChangeNotifierProvider(create: (_) => di.locator<ProfileNothifier>()),
        ChangeNotifierProvider(create: (_) => di.locator<LoginNothifier>()),
        ChangeNotifierProvider(create: (_) => di.locator<ProductDetailNothifier>()),
      ],
      child: MaterialApp(
          theme: thmeaSiang(),
          // navigatorObservers: [routeObserver],
          initialRoute: LoginPage.route,
          onGenerateRoute: navigasi),
    );
  }
}
