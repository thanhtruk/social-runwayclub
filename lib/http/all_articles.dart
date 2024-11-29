import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:runway_club_social/http/articles.dart';

Future<Article> CreateArticle(Article article) async {
  final String _url = Platform.isAndroid
      ? 'http://10.0.2.2:1234/api/v1/articles'
      : 'http://127.0.0.1:1234/api/v1/articles';

  final response = await http.post(
    Uri.parse(_url),
    body: jsonEncode(<String, dynamic>{
      'title': article.postName,
      'description': article.postDescription,
      'articleId': article.id.toString(),
      'userName': article.posterName,
      'uid': article.uid.toString(),
    }),
  );
  if (response.statusCode == 201) {
    return Article.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to create article.');
  }
}
