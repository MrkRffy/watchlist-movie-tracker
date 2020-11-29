import 'package:flutter/material.dart';
import 'package:watchlist/constants/images.dart';
import 'package:watchlist/data/models/movie_model.dart';

class MovieGrid extends StatelessWidget {
  final List<Movie> movies;

  const MovieGrid({Key key, @required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) => _buildMovieGridItem(movies[index]));
  }

  _buildMovieGridItem(movie) => Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: movie.hasPoster()
                ? NetworkImage(
                    movie.getPosterUrl(size: PosterSize.SMALL),
                  )
                : AssetImage("assets/images/no-image.png"),
          ),
        ),
      );
}
