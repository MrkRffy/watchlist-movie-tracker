import "dart:async";
import 'package:chopper/chopper.dart';

part 'genre_api_service.chopper.dart';

@ChopperApi(baseUrl: '/genre')
abstract class GenreApiService extends ChopperService {
  @Get(path: '/movie/list')
  Future<Response> getMovieGenres();

  static GenreApiService create([ChopperClient client]) => _$GenreApiService(client);
}
