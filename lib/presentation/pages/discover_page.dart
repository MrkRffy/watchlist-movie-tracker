import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist/logic/cubit/movie_popular_cubit.dart';
import 'package:watchlist/logic/cubit/show_trending_cubit.dart';
import 'package:watchlist/logic/cubit/tv_popular_cubit.dart';
import 'package:watchlist/presentation/animations/movie_card_loading_animation.dart';
import 'package:watchlist/presentation/widgets/show_grid.dart';
import 'package:watchlist/presentation/widgets/show_cards.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShowTrendingCubit>(
          create: (BuildContext context) => ShowTrendingCubit(),
        ),
        BlocProvider<MoviePopularCubit>(
          create: (BuildContext context) => MoviePopularCubit(),
        ),
        BlocProvider<TVPopularCubit>(
          create: (BuildContext context) => TVPopularCubit(),
        ),
      ],
      child: _buildDiscoverPage(),
    );
  }

  _buildDiscoverPage() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTrendingShows(),
            SizedBox(
              height: 50.0,
            ),
            _buildPopularMovies(),
            SizedBox(
              height: 50.0,
            ),
            _buildPopularTVShows()
          ],
        ),
      ),
    );
  }

  _buildTrendingShows() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Text(
            "Trending",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, letterSpacing: .5),
          ),
        ),
        BlocBuilder<ShowTrendingCubit, ShowTrendingState>(
          builder: (context, state) {
            if (state is ShowTrendingEmpty) {
              BlocProvider.of<ShowTrendingCubit>(context).getTrendingShows();
            } else if (state is ShowTrendingSuccess) {
              final shows = state.shows;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ShowCards(
                  shows: shows,
                ),
              );
            }

            return _buildShowCardLoading();
          },
        ),
      ],
    );
  }

  _buildPopularMovies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Text(
            "Popular Movies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
        ),
        BlocBuilder<MoviePopularCubit, MoviePopularState>(
          builder: (context, state) {
            if (state is MoviePopularEmpty) {
              BlocProvider.of<MoviePopularCubit>(context).getPopularMovies();
            } else if (state is MoviePopularSuccess) {
              final shows = state.movies;

              return ShowGrid(
                shows: shows,
              );
            }

            return _buildShowCardLoading();
          },
        ),
      ],
    );
  }

  _buildPopularTVShows() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Text(
            "Popular TV Shows",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
        ),
        BlocBuilder<TVPopularCubit, TVPopularState>(
          builder: (context, state) {
            if (state is TVPopularEmpty) {
              BlocProvider.of<TVPopularCubit>(context).getPopularTVShows();
            } else if (state is TVPopularSuccess) {
              final shows = state.tvShows;

              return ShowGrid(
                shows: shows,
              );
            }

            return _buildShowCardLoading();
          },
        ),
      ],
    );
  }

  _buildShowCardLoading() => MovieCardLoadingAnimation(skeleton: 'ShowCard');
}

class ShowUpcomingCubit {}
