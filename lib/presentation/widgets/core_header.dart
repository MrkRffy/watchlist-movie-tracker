import 'package:flutter/material.dart';
import 'package:watchlist/constants/strings.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => new Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 25.0,
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
