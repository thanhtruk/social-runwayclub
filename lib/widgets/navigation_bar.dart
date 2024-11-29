import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runway_club_social/app/profile_page/profile_page.dart';
import 'package:runway_club_social/http/authenticated_user.dart';

import '../../app/news_page/news_page.dart';
import '../../app/settings_page/settings_page.dart';
import '../app/notification_page/notification_page.dart';
import '../controller.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());
    Future<User> user = fetchUser(69);
    return Obx(
      () => Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            c.currentPageIndex.value = index;
          },
          indicatorColor: const Color(0xFFDEE1F9),
          selectedIndex: c.currentPageIndex.value,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.newspaper, color: Color(0xFF426ef0)),
              icon: Icon(Icons.newspaper_outlined),
              label: 'News',
            ),
            NavigationDestination(
              selectedIcon:
                  Icon(Icons.account_circle, color: Color(0xFF426ef0)),
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.notifications, color: Color(0xFF426ef0)),
              icon: Icon(Icons.notifications_none_outlined),
              label: 'Notification',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings, color: Color(0xFF426ef0)),
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
        body: <Widget>[
          NewsPage(),
          ProfilePage(user: user),
          NotificationPage(),
          const SettingsPage(),
        ][c.currentPageIndex.value],
      ),
    );
  }
}
