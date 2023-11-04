import 'package:dio/dio.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://localhost:8181/",
      headers: {},
      contentType: 'application/json',
    );

    dio = Dio(options);
  }

  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await dio.get(
      path,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  Future post(String path, dynamic data) async {
    var response = await dio.post(path, data: data);
    return response.data;
  }
}
