import "dart:async";
import 'package:chopper/chopper.dart';

part 'movie_api_service.chopper.dart';

@ChopperApi(baseUrl: '/movie')
abstract class MovieApiService extends ChopperService {
  @Get(path: '/popular')
  Future<Response> getPopular();

  @Get(path: '/upcoming')
  Future<Response> getUpcoming();

  static MovieApiService create([ChopperClient client]) => _$MovieApiService(client);
}
