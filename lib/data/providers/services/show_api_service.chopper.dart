// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ShowApiService extends ShowApiService {
  _$ShowApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ShowApiService;

  @override
  Future<Response<dynamic>> getWeeklyTrending() {
    final $url = '/trending/all/week';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getDailyTrending() {
    final $url = '/trending/all/day';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
