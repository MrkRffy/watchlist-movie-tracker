import 'package:flutter/material.dart';

import '../widgets/core_bottom_navigation.dart';
import '../widgets/core_header.dart';
import 'discover_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _pageController = PageController(initialPage: 0, keepPage: true);

  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: CoreHeader(),
      body: SafeArea(
        child: _buildPageView(),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  void _onTabTapped(index) {
    setState(() {
      _selectedTabIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  void _onPageChanged(index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  _buildPageView() => PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          DiscoverPage(),
        ],
      );

  Widget _buildBottomNavigation() {
    var _navItems = <NavItem>[
      NavItem(icon: Icons.search_rounded, label: "Discover"),
      NavItem(icon: Icons.ondemand_video_rounded, label: "Library"),
      NavItem(icon: Icons.settings, label: "Settings"),
    ];

    List<Widget> _buildBuildNavItems() {
      var items = <Widget>[];

      _navItems.asMap().forEach((index, navItem) {
        var isSelected = _selectedTabIndex == index;

        items.add(GestureDetector(
          onTap: () => _onTabTapped(index),
          child: AnimatedContainer(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            padding: EdgeInsets.symmetric(vertical: 7.5, horizontal: 20.0),
            decoration: BoxDecoration(
              color: isSelected ? Color.fromRGBO(243, 245, 247, 1) : Colors.white,
              borderRadius: BorderRadius.circular(100.0),
            ),
            duration: const Duration(milliseconds: 250),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(navItem.icon),
                SizedBox(
                  width: 8.0,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  vsync: this,
                  child: Text(
                    isSelected ? navItem.label : "",
                    style: TextStyle(
                      color: Color.fromRGBO(34, 34, 34, 1),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
      });

      return items;
    }

    return Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kElevationToShadow[2],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildBuildNavItems(),
      ),
    );
  }
}
