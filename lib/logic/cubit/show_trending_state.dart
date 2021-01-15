part of 'show_trending_cubit.dart';

@immutable
abstract class ShowTrendingState {}

class ShowTrendingEmpty extends ShowTrendingState {}

class ShowTrendingLoading extends ShowTrendingState {}

class ShowTrendingSuccess extends ShowTrendingState {
  final List<Show> shows;

  ShowTrendingSuccess({@required this.shows});
}

class ShowTrendingError extends ShowTrendingState {}
