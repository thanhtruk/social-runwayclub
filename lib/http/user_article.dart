import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<Blog> fetchBlog(int id) async {
  final response = await http.get(
    Uri.parse('https://social.runwayclub.dev/api/articles/$id'),
    headers: {
      HttpHeaders.authorizationHeader: 'xWSntrdaomV7gDjagTwsoBFw',
    },
  );
  final responseJson = jsonDecode(response.body);
  Blog blog = Blog.fromJson(responseJson);

  return blog;
}

class Blog {
  const Blog({
    required this.id,
    required this.blogImage,
    required this.blogTitle,
    // required this.blogTags,
    required this.blogUserName,
    required this.blogUserAvatar,
    required this.blogPublishedAt,
    required this.blogDescription,
    required this.blogContent,
    required this.blogCommentsCount,
    required this.blogReactsCount,
  });

  final int id;
  final String blogImage;
  final String blogTitle;

  // final List<String> blogTags;
  final String blogUserName;
  final String blogUserAvatar;
  final String blogPublishedAt;
  final String blogDescription;
  final String blogContent;
  final int blogCommentsCount;
  final int blogReactsCount;

  factory Blog.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id') &&
        json.containsKey('social_image') &&
        json.containsKey('title') &&
        json.containsKey('tag_list') &&
        json.containsKey('user') &&
        // json['user'] is Map<String, dynamic> &&
        json['user'].containsKey('name') &&
        json['user'].containsKey('profile_image') &&
        json.containsKey('readable_publish_date') &&
        json.containsKey('description') &&
        json.containsKey('body_markdown') &&
        json.containsKey('comments_count') &&
        json.containsKey('public_reactions_count')) {
      return Blog(
        id: json['id'] as int,
        blogImage: json['social_image'] as String,
        blogTitle: json['title'] as String,
        // blogTags: (json['tag_list'] as List<dynamic>).cast<String>(),
        blogUserName: json['user']['name'] as String,
        blogUserAvatar: json['user']['profile_image'] as String,
        blogPublishedAt: json['readable_publish_date'] as String,
        blogDescription: json['description'] as String,
        blogContent: json['body_markdown'] as String,
        blogCommentsCount: json['comments_count'] as int,
        blogReactsCount: json['public_reactions_count'] as int,
      );
    } else {
      throw FormatException('Failed to load.');
    }
  }
}

Future<Blog> postdataFuture = fetchBlog(1);
