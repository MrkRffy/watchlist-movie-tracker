import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:watchlist/constants/api.dart';

part "movie_api.chopper.dart";

@ChopperApi(baseUrl: '/movie')
abstract class MovieApi extends ChopperService {
  @Get(path: '/popular')
  Future<Response> getPopularMovies();

  static MovieApi create() {
    final chopperClient = ChopperClient(
      baseUrl: apiBaseUrl,
      services: [
        _$MovieApi()
      ],
      converter: JsonConverter(),
    );

    return _$MovieApi(chopperClient);
  }
}
