import 'package:bloc/bloc.dart';
import 'package:testingnewapp/Bloc/state.dart';
import 'package:testingnewapp/Server/Apiserver.dart';

class PostCubit extends Cubit<PostState> {
  final ApiService _apiService;

  PostCubit(this._apiService) : super(PostInitial());

  Future<void> fetchPosts() async {
    emit(PostLoading());
    try {
      final posts = await _apiService.fetchPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError('Failed to fetch posts'));
    }
  }
}
