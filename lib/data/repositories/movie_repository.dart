import 'dart:convert';

import 'package:watchlist/data/models/movie_model.dart';
import 'package:watchlist/data/providers/api_service.dart';
import 'package:watchlist/data/providers/services/movie_api_service.dart';

class MovieRepository {
  final chopper = ApiService().chopperClient;

  Future<List<Movie>> getPopularMovies() async {
    final movieService = chopper.getService<MovieApiService>();
    final response = await movieService.getPopular();

    final moviesJson = json.decode(response.bodyString);
    final moviesList = moviesJson['results'].map((data) => Movie.fromJson(data)).toList();

    List<Movie> movies = List<Movie>.from(moviesList);

    return movies;
  }
}
