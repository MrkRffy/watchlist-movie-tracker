import 'package:chopper/chopper.dart';
import 'package:watchlist/constants/api.dart';
import 'package:watchlist/data/providers/interceptors/api_auth_interceptor.dart';
import 'package:watchlist/data/providers/services/movie_api_service.dart';

class ApiService {
  ChopperClient chopperClient;

  ApiService() {
    chopperClient = ChopperClient(
      baseUrl: apiBaseUrl,
      services: [
        MovieApiService.create(),
      ],
      converter: JsonConverter(),
      interceptors: [
        ApiAuthInterceptor(),
      ],
    );
  }
}
