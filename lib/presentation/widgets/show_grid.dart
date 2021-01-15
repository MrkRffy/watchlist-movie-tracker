import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/constants/images.dart';
import 'package:watchlist/constants/routes.dart';
import 'package:watchlist/data/models/show_model.dart';

class ShowGrid extends StatelessWidget {
  final List<Show> shows;

  const ShowGrid({Key key, @required this.shows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        scrollDirection: Axis.horizontal,
        children: _buildShowGridItem(shows, context),
      ),
    );
  }

  _onShowItemTap(Show show, BuildContext context) {
    Navigator.pushNamed(
      context,
      showDetailRoute,
      arguments: {
        'show': show,
        'from': 'grid'
      },
    );
  }

  List<Widget> _buildShowGridItem(List<Show> shows, BuildContext context) {
    List<Widget> showItems = List<Widget>();

    shows.forEach((show) {
      showItems.add(GestureDetector(
        onTap: () => _onShowItemTap(show, context),
        child: Hero(
          tag: '${show.rawMediaType}-grid-${show.id}',
          child: Container(
            width: 160,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset.fromDirection(1, 2.0),
                ),
              ],
              borderRadius: BorderRadius.circular(25.0),
              color: Color.fromRGBO(32, 32, 32, 1),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: show.hasPoster
                    ? CachedNetworkImageProvider(
                        show.getPosterUrl(size: PosterSize.SMALL),
                      )
                    : AssetImage("assets/images/no-image.png"),
              ),
            ),
          ),
        ),
      ));
    });

    return showItems;
  }
}
