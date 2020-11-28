import 'dart:math';

import 'package:flutter/material.dart';
import 'package:watchlist/constants/images.dart';
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
      viewportFraction: 0.88,
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
          height: 550.0,
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

  _buildMovieCard(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          final Movie movie = movies[index];

          const double fullScale = 1.0;
          const double minScale = 0.9;

          double scale = fullScale;

          if (_pageController.position.haveDimensions) {
            scale = max(minScale, (fullScale - (index - _pageController.page).abs()));
          } else {
            scale = index == initialPage ? fullScale : minScale;
          }

          return Container(
            margin: EdgeInsets.only(right: 35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: movie.hasPoster()
                            ? NetworkImage(
                                movie.getPosterUrl(size: PosterSize.ORIGINAL),
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
          );
        },
      );
}
