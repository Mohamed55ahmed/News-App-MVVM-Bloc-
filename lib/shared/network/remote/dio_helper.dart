import 'package:dio/dio.dart';

/*
baseUrl="baseUrl=https://newsapi.org/";
method="v2/everything?";
 */

class DioHelper {
  static Dio? dio;


  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "baseUrl=https://newsapi.org/",
        receiveDataWhenStatusError: true));
  }

  static Future<Response?> getData({required String url, required Map<String,dynamic> query})async
  {
  return await  dio?.get(
      url,
      queryParameters: query,
    );
  }
}
