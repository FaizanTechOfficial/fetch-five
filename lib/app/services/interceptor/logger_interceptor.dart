import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  Logger logger = Logger();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final RequestOptions options = err.requestOptions;
    final String requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request => $requestPath');
    logger.d(
        'Error: ${err.error}, Message: ${err.message}, Data: ${_formatJson(err.response?.data ?? 'No response data')}');
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String requestPath = '${options.baseUrl}${options.path}';
    logger.i('${options.method} request => $requestPath');
    logger.d('Request Headers: ${options.headers}');
    if (options.data != null) {
      if (options.method.toUpperCase() == 'POST' ||
          options.method.toUpperCase() == 'GET') {
        if (options.contentType != null &&
            options.contentType!.contains('application/json')) {
          final String encodedBody = _formatJson(options.data);
          logger.d('Request Body: $encodedBody');
        } else {
          logger.d('Request Body: ${options.data}');
        }
      }
    }

    options.extra['startTime'] = DateTime.now().millisecondsSinceEpoch;

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final String requestPath =
        '${response.requestOptions.baseUrl}${response.requestOptions.path}';
    logger.i('${response.requestOptions.method} response => $requestPath');
    logger.d(
        'StatusCode: ${response.statusCode}, Data: ${_formatJson(response.data)}');

    final int startTime = response.requestOptions.extra['startTime'] ?? 0;
    final int endTime = DateTime.now().millisecondsSinceEpoch;
    final double elapsedTimeSeconds = (endTime - startTime) / 1000;

    // Log the time
    logger.d('Request took: $elapsedTimeSeconds seconds to complete');
    return super.onResponse(response, handler);
  }

  String _formatJson(dynamic json) {
    try {
      const JsonEncoder encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(json);
    } catch (e) {
      return json.toString();
    }
  }
}
