import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:watchlist/data/models/tv_model.dart';
import 'package:watchlist/data/repositories/tv_repository.dart';

part 'tv_popular_state.dart';

class TVPopularCubit extends Cubit<TVPopularState> {
  TVPopularCubit() : super(TVPopularEmpty());

  void getPopularTVShows() async {
    TVPopularLoading();

    final List<TV> tvShows = await TVRepository().getPopularTVShows();

    emit(TVPopularSuccess(tvShows: tvShows));
  }
}
