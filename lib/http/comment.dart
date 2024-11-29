import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<Comment> createComment(Comment comment) async {
  final String _url = Platform.isAndroid
      ? 'http://10.0.2.2:1234/api/v1/comment'
      : 'http://127.0.0.1:1234/api/v1/comment';

  final response = await http.post(
    Uri.parse(_url),
    body: jsonEncode(<String, dynamic>{
      'comment': comment.comment,
      'articleTitle': comment.articleTitle,
      'articleId': comment.articleId,
      'articleOwner': comment.articleOwner,
      'userName': comment.userName,
      'uid': comment.uid,
      'userImage': comment.userImage,
    }),
  );
  if (response.statusCode == 201) {
    return Comment.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to create comment.');
  }
}

class Comment {
  final String comment;
  final String articleTitle;
  final int articleId;
  final String articleOwner;
  final String userName;
  final int uid;
  final String userImage;

  Comment({
    required this.comment,
    required this.articleTitle,
    required this.articleId,
    required this.articleOwner,
    required this.userName,
    required this.uid,
    required this.userImage,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      comment: json['comment'],
      articleTitle: json['articleTitle'],
      articleId: json['articleId'],
      articleOwner: json['articleOwner'],
      userName: json['userName'],
      uid: json['uid'],
      userImage: json['userImage'],
    );
  }

  Map<String, dynamic> toJson() => {
        'comment': comment,
        'articleTitle': articleTitle,
        'articleId': articleId,
        'articleOwner': articleOwner,
        'userName': userName,
        'uid': uid,
        'userImage': userImage,
      };
}
