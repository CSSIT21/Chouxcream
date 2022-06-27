import 'package:chouxcream_app/classes/environment.dart';
import 'package:dio/dio.dart';

class Caller {
  static BaseOptions options = BaseOptions(
      baseUrl: EnvironmentConstant.api,
      connectTimeout: 5000,
      receiveTimeout: 3000,
  );

  static Dio dio = Dio(options);

  static setToken(String token) {
    dio.options.headers["Authorization"] = "Bearer $token";
  }
}