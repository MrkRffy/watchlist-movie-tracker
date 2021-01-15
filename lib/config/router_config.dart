import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/constants/routes.dart';
import 'package:watchlist/presentation/pages/home_page.dart';
import 'package:watchlist/presentation/pages/movie_detail_page.dart';

class RouterConfig {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (context) => HomePage());
      case showDetailRoute:
        return MaterialPageRoute(
          builder: (context) => MovieDetailPage(
            arguments: settings.arguments,
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}
