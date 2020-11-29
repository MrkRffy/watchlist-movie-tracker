import 'package:flutter/material.dart';
import 'package:watchlist/config/router_config.dart';
import 'package:watchlist/constants/routes.dart';
import 'package:watchlist/constants/strings.dart';
import 'package:watchlist/data/providers/api_service.dart';

void main() {
  ApiService();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      initialRoute: homeRoute,
      onGenerateRoute: RouterConfig.generateRoute,
    );
  }
}
