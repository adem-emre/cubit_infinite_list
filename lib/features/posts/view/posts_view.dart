import 'package:cubit_infinite_list/features/posts/cubit/post_cubit.dart';
import 'package:cubit_infinite_list/features/posts/service/post_service.dart';
import 'package:cubit_infinite_list/features/posts/widgets/post_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: BlocProvider<PostCubit>(
        create: (context) => PostCubit(PostService()),
        child: const PostList(),
      ),
    );
  }
}
