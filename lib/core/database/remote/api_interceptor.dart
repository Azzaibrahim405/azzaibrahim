import 'package:best_touch_training/core/database/local/cache_helper.dart';
import 'package:best_touch_training/core/database/remote/api_keys.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.headers[ApiKeys.token] =
        sl<CacheHelper>().getData(key: ApiKeys.token) != null) {
      options.headers[ApiKeys.token] =
          'Bearer ${sl<CacheHelper>().getData(key: ApiKeys.token)}';
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
