import 'package:dio/dio.dart';

final Dio dio = Dio(
  BaseOptions(
      baseUrl: 'https://672ae7e5976a834dd024d534.mockapi.io/',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000)),
);

class ApiClient {
  Future<Response> get(String path) async {
    try {
      final response = await dio.get(Uri.encodeFull(path));
      return response;
    } on DioException catch (e) {
      print(e.response?.data);
      throw e.response?.data['message'];
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await dio.post(Uri.encodeFull(path), data: data);
      return response;
    } on DioException catch (e) {
      print(e.response?.data);
      throw e.response?.data['message'];
    }
  }

  Future<Response> put(String path, dynamic data) async {
    try {
      final response = await dio.put(Uri.encodeFull(path), data: data);
      return response;
    } on DioException catch (e) {
      print(e.response?.data);
      throw e.response?.data['message'];
    }
  }

  Future<Response> delete(String path) async {
    try {
      final response = await dio.delete(Uri.encodeFull(path));
      return response;
    } on DioException catch (e) {
      print(e.response?.data);
      throw e.response?.data['message'];
    }
  }
}
