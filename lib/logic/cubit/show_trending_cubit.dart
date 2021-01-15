import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:watchlist/data/models/show_model.dart';
import 'package:watchlist/data/repositories/show_repository.dart';

part 'show_trending_state.dart';

class ShowTrendingCubit extends Cubit<ShowTrendingState> {
  ShowTrendingCubit() : super(ShowTrendingEmpty());

  void getTrendingShows() async {
    ShowTrendingLoading();

    final List<Show> shows = await ShowRepository().getWeeklyTrendingShows();

    emit(ShowTrendingSuccess(shows: shows));
  }
}
