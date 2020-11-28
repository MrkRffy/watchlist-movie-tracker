// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$GenreApiService extends GenreApiService {
  _$GenreApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = GenreApiService;

  @override
  Future<Response<dynamic>> getMovieGenres() {
    final $url = '/genre/movie/list';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
