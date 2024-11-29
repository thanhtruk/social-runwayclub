import 'package:flutter/material.dart';

import '../../github/sign_in.dart';

void main() {
  runApp(const MaterialApp(
    home: SettingsPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 20.0, right: 20.0, bottom: 5.0, top: 10.0),
              child: const Text(
                'All',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('Home'),
            ),
            const ListTile(
              leading: Icon(Icons.discord),
              title: Text('Discord'),
            ),
            const ListTile(
              leading: Icon(Icons.facebook),
              title: Text('Facebook'),
            ),
            const ListTile(
              leading: Icon(Icons.event),
              title: Text('Events'),
            ),
            const SizedBox(height: 10.0),
            const Divider(height: 1.0, thickness: 1.0),
            Container(
              margin: const EdgeInsets.only(
                  left: 20.0, right: 20.0, bottom: 5.0, top: 10.0),
              child: const Text(
                'Account settings',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.account_box_outlined),
              title: Text('Account'),
            ),
            const ListTile(
              leading: Icon(Icons.account_circle_outlined),
              title: Text('Profile'),
            ),
            const ListTile(
              leading: Icon(Icons.notifications_outlined),
              title: Text('Notification'),
            ),
            const ListTile(
              leading: Icon(Icons.group_outlined),
              title: Text('Organization'),
            ),
            const SizedBox(height: 10.0),
            const Divider(height: 1.0, thickness: 1.0),
            Container(
              margin: const EdgeInsets.only(
                  left: 20.0, right: 20.0, bottom: 5.0, top: 10.0),
              child: const Text(
                'Privacy',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.privacy_tip_outlined),
              title: Text('Privacy policy'),
            ),
            const ListTile(
              leading: Icon(Icons.book_outlined),
              title: Text('Terms of use'),
            ),
            const ListTile(
              leading: Icon(Icons.code_outlined),
              title: Text('Code of Conduct'),
            ),
            const SizedBox(height: 10.0),
            const Divider(height: 1.0, thickness: 1.0),
            Container(
              margin: const EdgeInsets.only(
                  left: 20.0, right: 20.0, bottom: 5.0, top: 10.0),
              child: const Text(
                'Others',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.dashboard_customize_outlined),
              title: Text('Customization'),
            ),
            const ListTile(
              leading: Icon(Icons.extension_outlined),
              title: Text('Extensions'),
            ),
            ListTile(
                leading: Icon(Icons.logout),
                title: Text('Sign out'),
                onTap: () async {
                  await FirebaseAuthService().signOut();
                  Navigator.pushNamed(context, '/SignIn');
                }),
          ],
        ),
      ),
    );
  }
}
