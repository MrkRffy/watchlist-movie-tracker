import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/constants/images.dart';
import 'package:watchlist/constants/routes.dart';
import 'package:watchlist/data/models/movie_model.dart';

class MovieCards extends StatefulWidget {
  final movies;

  MovieCards({Key key, @required this.movies}) : super(key: key);

  @override
  _MovieCardsState createState() => _MovieCardsState();
}

class _MovieCardsState extends State<MovieCards> {
  PageController _pageController;
  int initialPage = 0;

  List<Movie> movies = new List<Movie>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.85,
      initialPage: initialPage,
    );

    movies = widget.movies;
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
            itemCount: movies.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => _buildMovieCard(index),
            onPageChanged: (index) {},
          ),
        ),
      ],
    );
  }

  _onCardTap(movieId) {
    Navigator.pushNamed(context, movieDetailRoute, arguments: {
      'movieId': movieId
    });
  }

  _buildMovieCard(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          final Movie movie = movies[index];

          const double fullScalePadding = 0;
          const double minScalePadding = 50;
          const double fullScaleOpacity = 1.0;
          const double minScaleOpacity = 0.6;

          double padding = fullScalePadding;
          double opacity = fullScaleOpacity;

          bool pageControllerReady = _pageController.position.haveDimensions;

          if (pageControllerReady) {
            bool isNextPage = (index > _pageController.page && index <= _pageController.page + 1);
            bool isPreviousPage = (index <= _pageController.page);

            if (isNextPage) {
              double pageScroll = _pageController.page - int.parse(_pageController.page.toString().split('.')[0]);
              padding = minScalePadding - (minScalePadding * (pageScroll));
              opacity = minScaleOpacity + (0.4 * pageScroll);
            } else {
              padding = isPreviousPage ? fullScalePadding : minScalePadding;
            }
          } else {
            padding = index == initialPage ? fullScalePadding : minScalePadding;
            opacity = index == initialPage ? fullScaleOpacity : minScaleOpacity;
          }

          return GestureDetector(
            onTap: () => _onCardTap(movie.getId()),
            child: Opacity(
              opacity: opacity,
              child: Container(
                margin: EdgeInsets.only(right: 45.0),
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
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
                          color: Colors.grey.withOpacity(0.7),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: movie.hasPoster()
                                ? CachedNetworkImageProvider(
                                    movie.getPosterUrl(size: PosterSize.XLARGE),
                                  )
                                : AssetImage("assets/images/no-image.png"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      movie.getTitle(),
                      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(movie.getGenres())
                  ],
                ),
              ),
            ),
          );
        },
      );
}
