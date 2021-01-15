part of 'tv_popular_cubit.dart';

@immutable
abstract class TVPopularState {}

class TVPopularEmpty extends TVPopularState {}

class TVPopularLoading extends TVPopularState {}

class TVPopularSuccess extends TVPopularState {
  final List<TV> tvShows;

  TVPopularSuccess({@required this.tvShows});
}

class TVPopularError extends TVPopularState {}
