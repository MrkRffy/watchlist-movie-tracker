import 'dart:convert';

import 'package:watchlist/data/models/show_model.dart';
import 'package:watchlist/data/providers/api_service.dart';
import 'package:watchlist/data/providers/services/show_api_service.dart';

class ShowRepository {
  final chopper = ApiService().chopperClient;

  Future<List<Show>> getWeeklyTrendingShows() async {
    final showService = chopper.getService<ShowApiService>();
    final response = await showService.getWeeklyTrending();

    final showsJson = json.decode(response.bodyString);

    // Remove Trending Persons from the list.
    final showsResult = showsJson['results']?.where((data) => data['media_type'] != 'person');

    final showsList = showsResult.map((data) => Show.fromJson(data)).toList();

    List<Show> shows = List<Show>.from(showsList);

    return shows;
  }
}
