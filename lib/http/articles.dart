import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<Article>> fetchArticle() async {
  final response = await http.get(
    Uri.parse(
        'https://social.runwayclub.dev/api/articles/latest?page=1&per_page=30'),
    // Send authorization headers to the backend.
  );
  final responseJson = jsonDecode(response.body) as List;
  List<Article> articles = [];

  for (var articleJson in responseJson) {
    articles.add(Article.fromJson(articleJson));
  }

  return articles;
}

class Article {
  const Article({
    required this.id,
    required this.postImagePath,
    required this.postName,
    required this.tags,
    required this.posterName,
    required this.posterAvatarPath,
    required this.postDate,
    required this.postDescription,
    required this.uid,
  });

  final int id;
  final String postImagePath;
  final String postName;
  final List<String> tags;
  final String posterName;
  final String posterAvatarPath;
  final String postDate;
  final String postDescription;
  final int uid;

  factory Article.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id') &&
        json.containsKey('social_image') &&
        json.containsKey('title') &&
        json.containsKey('tag_list') &&
        json.containsKey('user') &&
        json['user'] is Map<String, dynamic> &&
        json['user'].containsKey('name') &&
        json['user'].containsKey('profile_image') &&
        json['user'].containsKey('user_id') &&
        json.containsKey('readable_publish_date') &&
        json.containsKey('description')) {
      return Article(
        id: json['id'] as int,
        postImagePath: json['social_image'] as String,
        postName: json['title'] as String,
        tags: (json['tag_list'] as List<dynamic>).cast<String>(),
        posterName: json['user']['name'] as String,
        posterAvatarPath: json['user']['profile_image'] as String,
        uid: json['user']['user_id'] as int,
        postDate: json['readable_publish_date'] as String,
        postDescription: json['description'] as String,
      );
    } else {
      throw FormatException('Failed to load.');
    }
  }
}

Future<List<Article>> postdataFuture = fetchArticle();
