import 'package:dio/dio.dart';

import '../../constants/constans.dart';
import '../cache/xc_cache.dart';

class TokenInterceptor extends Interceptor {
  const TokenInterceptor();

  final String tokenKey = "Authorization";

  /// Called when the request is about to be sent.
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    String? accessToken =
        XCCache.getInstance().getData(GlobalConfig.accessToken);
    if (accessToken != null) {
      options.headers[tokenKey] = "Bearer $accessToken";
    }
    handler.next(options);
  }

  /// Called when the response is about to be resolved.
  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }

  /// Called when an exception was occurred during the request.
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    handler.next(err);
  }
}
