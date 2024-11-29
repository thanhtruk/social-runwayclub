import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<NotificationUser> createNotification(NotificationUser notification) async {
  final String _url = Platform.isAndroid
      ? 'http://10.0.2.2:1234/api/v1/notification'
      : 'http://127.0.0.1:1234/api/v1/notification';

  final response = await http.post(
    Uri.parse(_url),
    body: jsonEncode(<String, dynamic>{
      'articleTitle': notification.articleTitle,
      'articleId': notification.articleId,
      'articleOwner': notification.articleOwner,
      'userName': notification.userName,
      'uid': notification.uid,
      'userImage': notification.userImage,
      'notification': notification.notification,
    }),
  );
  if (response.statusCode == 201) {
    return NotificationUser.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to create notification.');
  }
}


class NotificationUser{
  final String articleTitle;
  final int articleId;
  final String articleOwner;
  final String userName;
  final int uid;
  final String userImage;
  final String notification;

  NotificationUser({
    required this.articleTitle,
    required this.articleId,
    required this.articleOwner,
    required this.userName,
    required this.uid,
    required this.userImage,
    required this.notification,
  });

  factory NotificationUser.fromJson(Map<String, dynamic> json) {
    return NotificationUser(
      articleTitle: json['articleTitle'],
      articleId: json['articleId'],
      articleOwner: json['articleOwner'],
      userName: json['userName'],
      uid: json['uid'],
      userImage: json['userImage'],
      notification: json['notification'],
    );
  }

  Map<String, dynamic> toJson() => {
    'articleTitle': articleTitle,
    'articleId': articleId,
    'articleOwner': articleOwner,
    'userName': userName,
    'uid': uid,
    'userImage': userImage,
    'notification': notification,
  };
}

