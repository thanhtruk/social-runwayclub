import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:runway_club_social/http/comment.dart';

Future<List<Comment>> GetCommentsById(int id) async {
  final String _url = Platform.isAndroid
      ? 'http://10.0.2.2:1234/api/v1/comments/$id'
      : 'http://127.0.0.1:1234/api/v1/comments/$id';

  try {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final dynamic responseJson = jsonDecode(response.body);

      if (responseJson is List) {
        List<Comment> comments = [];
        for (var commentJson in responseJson) {
          comments.add(Comment.fromJson(commentJson));
        }
        return comments;
      } else if (responseJson is Map<String, dynamic>) {
        return [Comment.fromJson(responseJson)];
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception(
          'API request failed with status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Error fetching comments: $error');
    return [];
  }
}
