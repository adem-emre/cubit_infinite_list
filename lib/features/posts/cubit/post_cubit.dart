import 'package:bloc/bloc.dart';
import 'package:cubit_infinite_list/features/posts/model/post_model.dart';
import 'package:cubit_infinite_list/features/posts/service/post_service.dart';
import 'package:equatable/equatable.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this._postService) : super(const PostState()){
    fetchPosts();
  }

  final PostService _postService;

  Future fetchPosts() async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PostStatus.initial) {
        final posts = await _postService.fetchPosts();
        return emit(state.copyWith(
          status: PostStatus.success,
          posts: posts,
          hasReachedMax: false,
        ));
      }
      await Future.delayed(const Duration(milliseconds: 300));
      final posts = await _postService.fetchPosts(state.posts.length);
      posts.isEmpty ? emit(state.copyWith(
        hasReachedMax: true
      )) : emit(state.copyWith(
        status: PostStatus.success,
        posts: List.of(state.posts)..addAll(posts),
        hasReachedMax: false
      ));
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

 
}
