import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  const PostModel({this.userId, this.id, this.title, this.body});

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  @override
  List<Object?> get props => [userId,id,title,body];
}