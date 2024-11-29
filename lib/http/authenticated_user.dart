import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<User> fetchUser(int id) async {
  final response = await http.get(
    Uri.parse('https://social.runwayclub.dev/api/users/$id'),
    headers: {
      HttpHeaders.authorizationHeader: 'xWSntrdaomV7gDjagTwsoBFw',
    },
  );

  // print('API Response: ${response.body}'); // Add this line
  final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
  User user = User.fromJson(responseJson);
  return user;
}

class User {
  const User({
    required this.uid,
    required this.userName,
    required this.name,
    required this.githubUserName,
    required this.summary,
    required this.location,
    required this.websiteUrl,
    required this.joinedAt,
    required this.profileImage,
  });

  final int uid;
  final String userName;
  final String name;
  final String githubUserName;
  final String summary;
  final String location;
  final String websiteUrl;
  final String joinedAt;
  final String profileImage;

  factory User.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id') &&
        json.containsKey('username') &&
        json.containsKey('name') &&
        json.containsKey('github_username') &&
        json.containsKey('summary') &&
        json.containsKey('location') &&
        json.containsKey('website_url') &&
        json.containsKey('joined_at') &&
        json.containsKey('profile_image')) {
      return User(
        uid: json['id'] as int,
        userName: json['username'] as String,
        name: json['name'] as String,
        githubUserName: json['github_username'] as String,
        summary: json['summary'] as String,
        location: json['location'] as String,
        websiteUrl: json['website_url'] as String,
        joinedAt: json['joined_at'] as String,
        profileImage: json['profile_image'] as String,
      );
    } else {
      throw FormatException('Failed to load.');
    }
  }
}

Future<User> userData = fetchUser(69);
