part of 'movie_bloc.dart';

@immutable
abstract class MovieState {}

class MovieEmpty extends MovieState {}

class MovieLoading extends MovieState {}

class MovieSuccess extends MovieState {
  final List<Movie> movies;

  MovieSuccess({@required this.movies}) : assert(movies != null);

  @override
  List<Object> get props => [
        movies
      ];
}

class MovieError extends MovieState {}
