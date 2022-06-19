import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mythic_design/presentation/page/home_page.dart';
import 'package:mythic_design/presentation/page/login_page.dart';
import 'package:mythic_design/presentation/page/notifikasi_page.dart';
import 'package:mythic_design/presentation/page/profile_creator_page.dart';
import 'package:mythic_design/presentation/page/profile_page.dart';
import 'package:mythic_design/presentation/page/search_page.dart';
import 'package:mythic_design/presentation/page/wishlist_page.dart';

import 'presentation/page/product_detail_page.dart';

Route<dynamic>? navigasi(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return null;
    case HomePage.route:
      return MaterialPageRoute(builder: (_) => const HomePage());
    case ProfilePage.routeName:
      return MaterialPageRoute(builder: (_) => const ProfilePage());
    case ProductDetailPage.route: 
      return MaterialPageRoute(builder: (_) =>  ProductDetailPage(productId: settings.arguments as String,));
    case LoginPage.route:
      return MaterialPageRoute(builder: (_) =>  LoginPage());
    case ProfileCreatorPage.route:
      return MaterialPageRoute(builder: (_) =>  ProfileCreatorPage(creatorId : settings.arguments as String));
    case SearchPage.route:
      return MaterialPageRoute(builder: (_) => const SearchPage());
    // case MovieDetailPage.ROUTE_NAME:
    //   final id = settings.arguments as int;
    //   return MaterialPageRoute(
    //     builder: (_) => MovieDetailPage(id: id),
    //     settings: settings,
    //   );
    case NotifikasiPage.route:
      return CupertinoPageRoute(builder: (_) => const NotifikasiPage());
    case WishlistPage.route:
      return CupertinoPageRoute(builder: (_) => const WishlistPage());
    // case WatchlistMoviesPage.ROUTE_NAME:
    //   return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
    // case AboutPage.ROUTE_NAME:
    //   return MaterialPageRoute(builder: (_) => AboutPage());
    default:
      return MaterialPageRoute(builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text('Page not found :('),
          ),
        );
      });
  }
}
