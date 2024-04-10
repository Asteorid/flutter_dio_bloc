import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dio_bloc/api/api_post_service.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiService apiService;

  PostBloc({required this.apiService}) : super(PostInitial()) {
    on<FetchPost>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await apiService.getPosts();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError("Error fetching post: $e"));
      }
    });
  }
}
