import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mythic_design/common/helper_local.dart';
import 'package:mythic_design/common/thema_app.dart';
import 'package:mythic_design/presentation/page/home_page.dart';
import 'package:provider/provider.dart';

import 'injection.dart' as di;

import 'presentation/provider/creator_nothifier.dart';
import 'presentation/provider/detail_product_nothifier.dart';
import 'presentation/provider/home_nothifier.dart';
import 'presentation/provider/login_nothifier.dart';
import 'presentation/provider/nitifikasi_nothifier.dart';
import 'presentation/provider/profile_nothifier.dart';
import 'presentation/provider/wishlist_nothifier.dart';
import 'route_name.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
  // HelperLocal().saveLogin(login: false);
  
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.locator<HomeNotifier>()),
        ChangeNotifierProvider(create: (_) => di.locator<ProfileNothifier>()),
        ChangeNotifierProvider(create: (_) => di.locator<LoginNothifier>()),
        ChangeNotifierProvider(
            create: (_) => di.locator<ProductDetailNothifier>()),
        ChangeNotifierProvider(create: (_) => di.locator<CreatorNothifier>()),
        ChangeNotifierProvider(create: (_) => di.locator<WishlistNothifier>()),
        ChangeNotifierProvider(
            create: (_) => di.locator<NotifikasiNothifier>()),
      ],
      child: MaterialApp(
          theme: thmeaSiang(),
          // navigatorObservers: [routeObserver],
          initialRoute: HomePage.route,
          onGenerateRoute: navigasi),
    );
  }
}
