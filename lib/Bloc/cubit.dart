import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:testingnewapp/Bloc/state.dart';
import 'package:testingnewapp/Server/Apiserver.dart';

final getIt = GetIt.instance;

class PostCubit extends Cubit<PostState> {
  final ApiService _apiService = getIt<ApiService>();

  PostCubit() : super(PostInitial());

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
