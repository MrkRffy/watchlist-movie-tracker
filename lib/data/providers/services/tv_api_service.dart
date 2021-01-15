import "dart:async";
import 'package:chopper/chopper.dart';

part 'tv_api_service.chopper.dart';

@ChopperApi(baseUrl: '/tv')
abstract class TVApiService extends ChopperService {
  @Get(path: '/popular')
  Future<Response> getPopular();

  @Get(path: '/upcoming')
  Future<Response> getUpcoming();

  static TVApiService create([ChopperClient client]) => _$TVApiService(client);
}
