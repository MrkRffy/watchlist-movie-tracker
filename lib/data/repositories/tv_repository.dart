import 'dart:convert';

import 'package:watchlist/data/models/tv_model.dart';
import 'package:watchlist/data/providers/api_service.dart';
import 'package:watchlist/data/providers/services/tv_api_service.dart';

class TVRepository {
  final chopper = ApiService().chopperClient;

  Future<List<TV>> getPopularTVShows() async {
    final movieService = chopper.getService<TVApiService>();
    final response = await movieService.getPopular();

    final moviesJson = json.decode(response.bodyString);
    final moviesList = moviesJson['results'].map((data) => TV.fromJson(data)).toList();

    List<TV> movies = List<TV>.from(moviesList);

    return movies;
  }

  Future<List<TV>> getUpcomingTVs() async {
    final movieService = chopper.getService<TVApiService>();
    final response = await movieService.getUpcoming();

    final moviesJson = json.decode(response.bodyString);
    final moviesList = moviesJson['results'].map((data) => TV.fromJson(data)).toList();

    List<TV> movies = List<TV>.from(moviesList);

    return movies;
  }
}
