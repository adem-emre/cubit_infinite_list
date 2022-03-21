import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/post_model.dart';

class PostService {
  final _baseUrl = "jsonplaceholder.typicode.com";
  final _postLimit = 20;

  Future<List<PostModel>> fetchPosts([int startIndex = 0]) async {
    var response = await http.get(Uri.https(_baseUrl, "/posts",
        <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'}));

    if (response.statusCode == 200) {
      List<PostModel> posts = (jsonDecode(response.body) as List)
          .map((postJson) => PostModel.fromJson(postJson))
          .toList();
      return posts;
    } else {
      throw Exception("Error Fetching Post : ${response.statusCode}");
    }
  }
}
