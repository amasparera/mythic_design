import 'package:flutter/material.dart';
import 'package:mythic_design/presentation/page/home_page.dart';
import 'package:mythic_design/presentation/page/profile_page.dart';

// final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

Route<dynamic>? navigasi(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (_) => const HomePage());
    case HomePage.route:
      return MaterialPageRoute(builder: (_) => const HomePage());
    case ProfilePage.routeName:
      return MaterialPageRoute(builder: (_) => const ProfilePage());
    // case TopRatedMoviesPage.ROUTE_NAME:
    //   return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
    // case MovieDetailPage.ROUTE_NAME:
    //   final id = settings.arguments as int;
    //   return MaterialPageRoute(
    //     builder: (_) => MovieDetailPage(id: id),
    //     settings: settings,
    //   );
    // case SearchPage.ROUTE_NAME:
    //   return CupertinoPageRoute(builder: (_) => SearchPage());
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
