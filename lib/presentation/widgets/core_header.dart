import 'package:flutter/material.dart';
import 'package:watchlist/constants/strings.dart';

class CoreHeader extends StatelessWidget implements PreferredSizeWidget {
  static const double headerHeight = 80.0;

  @override
  Size get preferredSize => new Size.fromHeight(headerHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 35.0,
      ),
      child: Row(
        children: [
          Image(
            image: AssetImage('assets/images/app_icon.png'),
            height: 45.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              appName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
          Icon(
            Icons.search,
            size: 30.0,
          ),
        ],
      ),
    );
  }
}
