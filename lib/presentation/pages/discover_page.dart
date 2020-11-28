import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist/logic/bloc/bloc/movie_bloc.dart';
import 'package:watchlist/presentation/widgets/movie_cards.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieEmpty) {
            BlocProvider.of<MovieBloc>(context).add(GetPopularMovies());
          } else if (state is MovieSuccess) {
            final movies = state.movies;
            return _buildDiscoverPage(movies);
          } else if (state is MovieError) {
            return _buildError();
          }

          return _buildLoading();
        },
      ),
    );
  }

  _buildDiscoverPage(movies) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Popular Movies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: MovieCards(
                movies: movies,
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildPopularMovies() {}

  _buildLoading() => Center(
        child: CircularProgressIndicator(),
      );

  _buildError() => Center(
        child: Text("Something went wrong."),
      );
}
