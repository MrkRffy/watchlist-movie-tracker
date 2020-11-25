import 'package:flutter/material.dart';

class CoreBottomNavigation extends StatefulWidget {
  CoreBottomNavigation({Key key}) : super(key: key);

  @override
  _CoreBottomNavigationState createState() => _CoreBottomNavigationState();
}

class _CoreBottomNavigationState extends State<CoreBottomNavigation> with TickerProviderStateMixin {
  List<NavItem> _navItems = [
    NavItem(icon: Icons.search_rounded, label: "Discover"),
    NavItem(icon: Icons.ondemand_video_rounded, label: "Library"),
    NavItem(icon: Icons.settings, label: "Settings"),
  ];

  int _selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
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

  List<Widget> _buildBuildNavItems() {
    List<Widget> items = List();

    _navItems.asMap().forEach((index, navItem) {
      bool isSelected = _selectedNavIndex == index;

      items.add(GestureDetector(
        onTap: () {
          setState(() {
            _selectedNavIndex = index;
          });
        },
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
}

class NavItem {
  IconData icon;
  String label;

  NavItem({this.icon, this.label});
}
