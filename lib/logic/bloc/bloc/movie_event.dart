part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class GetPopularMovies extends MovieEvent {}

class SetActiveCard extends MovieEvent {}
