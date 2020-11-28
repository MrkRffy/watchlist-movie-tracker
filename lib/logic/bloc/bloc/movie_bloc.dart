import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:watchlist/data/models/movie_model.dart';
import 'package:watchlist/data/repositories/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieEmpty());

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is GetPopularMovies) {
      yield MovieLoading();

      final List<Movie> movies = await MovieRepository().getPopularMovies();
      yield MovieSuccess(movies: movies);
    }
  }
}
