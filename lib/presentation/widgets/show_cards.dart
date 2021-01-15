import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/constants/images.dart';
import 'package:watchlist/constants/routes.dart';
import 'package:watchlist/data/models/show_model.dart';
import 'package:watchlist/presentation/animations/show_card_animation.dart';

class ShowCards extends StatefulWidget {
  final List<dynamic> shows;

  ShowCards({Key key, @required this.shows}) : super(key: key);

  @override
  _ShowCardsState createState() => _ShowCardsState();
}

class _ShowCardsState extends State<ShowCards> {
  PageController _pageController;
  int initialPage = 0;

  List<dynamic> shows = new List<dynamic>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.85,
      initialPage: initialPage,
      keepPage: true,
    );

    shows = widget.shows;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 520.0,
          child: PageView.builder(
            controller: _pageController,
            itemCount: shows.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => _buildShowCard(index),
            onPageChanged: (index) {},
          ),
        ),
      ],
    );
  }

  _onCardTap(Show show, int index) {
    initialPage = index;

    Navigator.pushNamed(
      context,
      showDetailRoute,
      arguments: {
        'show': show,
        'from': 'card'
      },
    );
  }

  _buildShowCard(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          final Show show = shows[index];

          ShowCardAnimation showCardAnimation = ShowCardAnimation(pageController: _pageController, initialPage: initialPage, index: index);

          return GestureDetector(
            onTap: () => _onCardTap(show, index),
            child: AnimatedOpacity(
              opacity: showCardAnimation.cardOpacity,
              duration: Duration(milliseconds: 1),
              child: AnimatedPadding(
                duration: Duration(milliseconds: 1),
                padding: EdgeInsets.symmetric(vertical: showCardAnimation.cardPadding),
                child: Container(
                  margin: EdgeInsets.only(right: 45.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Hero(
                          tag: '${show.rawMediaType}-card-${show.id}',
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  spreadRadius: 1,
                                  blurRadius: 15,
                                  offset: Offset.fromDirection(1.5, 10.0),
                                ),
                              ],
                              color: Color.fromRGBO(32, 32, 32, 1),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: show.hasPoster
                                    ? CachedNetworkImageProvider(
                                        show.getPosterUrl(size: PosterSize.XLARGE),
                                      )
                                    : AssetImage("assets/images/no-image.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        show.showTitle,
                        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, letterSpacing: 1.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 12.0),
                        decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(5.0)),
                        child: Text(
                          show.type.toUpperCase(),
                          style: TextStyle(fontSize: 12.0, letterSpacing: 1.5, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
}
