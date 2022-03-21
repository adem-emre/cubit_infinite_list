
import 'package:cubit_infinite_list/features/posts/model/post_model.dart';
import 'package:flutter/material.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.post}) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Card(
        child: ListTile(
          leading: Text('${post.id}', style: textTheme.caption),
          title: Text(post.title??""),
          isThreeLine: true,
          subtitle: Text(post.body??""),
          dense: true,
        ),
      ),
    );
  }
}