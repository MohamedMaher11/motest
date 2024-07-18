import 'package:dio/dio.dart';
import 'package:testingnewapp/Model/model.dart';

class Getdata {
  Future<Posts> getdata() async {
    final respose =
        await Dio().get("https://jsonplaceholder.typicode.com/posts");
    return respose.data;
  }
}
