import 'package:flutter/material.dart';
import 'package:watchlist/constants/strings.dart';
import 'package:watchlist/data/providers/api_service.dart';
import 'package:watchlist/presentation/pages/discover_page.dart';
import 'package:watchlist/presentation/widgets/core_bottom_navigation.dart';
import 'package:watchlist/presentation/widgets/core_header.dart';

void main() {
  ApiService();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      home: Scaffold(
        appBar: CoreHeader(),
        body: SafeArea(
          child: DiscoverPage(),
        ),
        bottomNavigationBar: CoreBottomNavigation(),
      ),
    );
  }
}
