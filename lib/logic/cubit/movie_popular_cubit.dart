import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:watchlist/data/models/movie_model.dart';
import 'package:watchlist/data/repositories/movie_repository.dart';

part 'movie_popular_state.dart';

class MoviePopularCubit extends Cubit<MoviePopularState> {
  MoviePopularCubit() : super(MoviePopularEmpty());

  void getPopularMovies() async {
    MoviePopularLoading();

    final List<Movie> movies = await MovieRepository().getPopularMovies();

    emit(MoviePopularSuccess(movies: movies));
  }
}
