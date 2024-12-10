import 'package:dio/dio.dart';
import 'package:fetch_five/app/services/interceptor/logger_interceptor.dart';
import 'package:fetch_five/app/services/local/shared_pref.dart';
import 'package:get/get.dart' hide Response;

class DioClient extends GetxService {
  late final Dio _dio;

  @override
  void onInit() {
    super.onInit();
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.fetchfive.com/',
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        responseType: ResponseType.json,
      ),
    )..interceptors.addAll([LoggerInterceptor()]);
  }

  Future<Response> post(String url, {Map<String, dynamic>? data}) async {
    final token = await SharedPref().getString(SharedPref.tokenKey);

    return _dio.post(url,
        data: data,
        options: Options(headers: {'Authorization': "bearer ${token}"}));
  }

  Future<Response> get(String url, {dynamic sessionId}) async {
    return _dio.get(
      url,
      options: Options(headers: {'Authorization': "bearer $sessionId"}),
    );
  }

  Future<Response> logout(String url, {required String sessionId}) async {
    return _dio.get(
      url,
      options: Options(headers: {'authorization': "Bearer $sessionId"}),
    );
  }
}
