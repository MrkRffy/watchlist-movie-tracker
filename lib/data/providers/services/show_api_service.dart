import "dart:async";
import 'package:chopper/chopper.dart';

part 'show_api_service.chopper.dart';

@ChopperApi(baseUrl: '')
abstract class ShowApiService extends ChopperService {
  @Get(path: '/trending/all/week')
  Future<Response> getWeeklyTrending();

  @Get(path: '/trending/all/day')
  Future<Response> getDailyTrending();

  static ShowApiService create([ChopperClient client]) => _$ShowApiService(client);
}
