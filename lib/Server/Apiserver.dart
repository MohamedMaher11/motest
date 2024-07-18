import 'package:dio/dio.dart';
import 'package:testingnewapp/Model/model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Post>> fetchPosts() async {
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts');
      return (response.data as List) // as list of json
          .map((post) => Post.fromJson(post))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch posts');
    }
  }
}
