import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:testingnewapp/Bloc/state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  final Dio _dio = Dio();

  Future<void> fetchPosts() async {
    emit(PostLoading());
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts');
      emit(PostLoaded(response.data));
    } catch (e) {
      emit(PostError('Failed to fetch posts'));
    }
  }
}
