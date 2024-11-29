import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:runway_club_social/http/notification.dart';

Future<List<NotificationUser>> getNotifications(int uid) async {
  final String _url = Platform.isAndroid
      ? 'http://10.0.2.2:1234/api/v1/notifications/$uid'
      : 'http://127.0.0.1:1234/api/v1/notifications/$uid';

  try {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final dynamic responseJson = jsonDecode(response.body);

      if (responseJson is List) {
        List<NotificationUser> notifications = [];
        for (var notificationJson in responseJson) {
          notifications.add(NotificationUser.fromJson(notificationJson));
        }
        return notifications;
      } else if (responseJson is Map<String, dynamic>) {
        return [NotificationUser.fromJson(responseJson)];
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception(
          'API request failed with status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Error fetching notifications: $error');
    return [];
  }
}

Future<List<NotificationUser>> notifications = getNotifications(69);