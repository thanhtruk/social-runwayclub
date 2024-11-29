import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:runway_club_social/http/user_article.dart';

Future<UserPost> CreateUser(Blog blog) async {
  final String _url = Platform.isAndroid
      ? 'http://10.0.2.2:1234/api/v1/user'
      : 'http://127.0.0.1:1234/api/v1/user';
  final response = await http.post(
    Uri.parse(_url),
    body: jsonEncode(<String, dynamic>{
      'userName': blog.blogUserName,
      'uid': blog.id.toString(),
    }),
  );
  if (response.statusCode == 201) {
    return UserPost.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to create album.');
  }
}

class UserPost {
  final String userName;
  final String uid;

  const UserPost({
    required this.userName,
    required this.uid,
  });

  factory UserPost.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userName': String userName,
        'uid': String uid,
      } =>
        UserPost(
          userName: userName,
          uid: uid,
        ),
      _ => throw const FormatException('Failed to load UserPost.'),
    };
  }
}
