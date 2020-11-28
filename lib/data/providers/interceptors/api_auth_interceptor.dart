import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:watchlist/constants/api.dart';

class ApiAuthInterceptor extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    final params = Map<String, dynamic>.from(request.parameters);
    params['api_key'] = apiKey;

    return request.copyWith(parameters: params);
  }
}
