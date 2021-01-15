part of 'movie_popular_cubit.dart';

@immutable
abstract class MoviePopularState {}

class MoviePopularEmpty extends MoviePopularState {}

class MoviePopularLoading extends MoviePopularState {}

class MoviePopularSuccess extends MoviePopularState {
  final List<Movie> movies;

  MoviePopularSuccess({@required this.movies});
}

class MoviePopularError extends MoviePopularState {}
