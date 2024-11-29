import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:runway_club_social/http/user_notification.dart';
import 'package:runway_club_social/http/notification.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  var postdata = [
    {
      'postContent': '"hayyyyyyyyyyyy quá"',
      'postDate': DateTime(2023, 9, 9),
      'postImagePath': 'assets/images/postimage1.png',
      'postName': 'He just left a comment on HTML, CSS, JavaScript là gì?',
      'posterAvatarPath': 'assets/images/avt1.jpg',
      'posterName': 'thanhhuy5902',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Notification'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Colors.black,
            ),
          ],
          bottom: TabBar(
            labelStyle: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
            labelColor: Colors.black,
            unselectedLabelStyle: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.black.withOpacity(0.5),
            tabs: const [
              Tab(
                text: 'All',
              ),
              Tab(text: 'Comments'),
              Tab(text: 'Post'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Center(
                child: FutureBuilder<List<NotificationUser>>(
                  future: getNotifications(69),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      List<NotificationUser> notifications = snapshot.data!;
                      List<Widget> postWidgets = notifications.map((notification) {
                        return Column(
                          children: [
                            const SizedBox(height: 10),
                            PostCard(
                              postName: notification.articleTitle,
                              posterName: notification.userName,
                              posterAvatarPath: notification.userImage,
                              // postDate: notification.postDate,
                              postContent: notification.notification,
                            ),
                          ],
                        );
                      }).toList();
                      return Column(
                        children:
                        postWidgets,
                      );
                    }
                  },

                ),
              ),
            ),
            Container(
              child: Center(
                child: Text('Comments'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Posts'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    //required this.postImagePath,
    required this.postName,
    //required this.tag,
    required this.posterName,
    required this.posterAvatarPath,
    // required this.postDate,
    required this.postContent,
  });

  final String postName;
  final String posterName;
  final String posterAvatarPath;
  // final DateTime postDate;
  final String postContent;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var width = screenWidth * 0.94;

    return SizedBox(
      width: width,
      child: Card(
        surfaceTintColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(posterAvatarPath),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(posterName,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      // Text(DateFormat("MMM d''yy").format(postDate),
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .bodyLarge
                      //         ?.copyWith(
                      //             color: Theme.of(context)
                      //                 .colorScheme
                      //                 .onSurface
                      //                 .withOpacity(0.5))),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(postName,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  Text(
                    postContent,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
