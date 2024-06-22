// lib/data/api/image_service.dart
import 'package:dio/dio.dart';

class ImageService {
  final Dio dio;

  ImageService({required this.dio}) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Accept'] = 'application/json';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('Response received: ${response.data}'); // Log the API response
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        print('Request error: ${e.message}');
        return handler.next(e);
      },
    ));
  }

  Future<List<dynamic>> fetchImages() async {
    try {
      final response = await dio.get('https://picsum.photos/v2/list');
      print('API Call Success: ${response.statusCode}');
      return response.data;
    } catch (e) {
      print('Error fetching images: $e');
      throw Exception('Failed to load images');
    }
  }
}
