import 'package:flutter/material.dart';
import 'package:watchlist/data/models/show.dart';

class DiscorverPopularShows extends StatefulWidget {
  DiscorverPopularShows({Key key}) : super(key: key);

  @override
  _DiscorverPopularShowsState createState() => _DiscorverPopularShowsState();
}

class _DiscorverPopularShowsState extends State<DiscorverPopularShows> {
  PageController _pageController;
  int initialPage = 0;

  Show show;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );

    show = shows[initialPage];
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Popular Movies")
        ],
      ),
    );
  }
}
