import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:runway_club_social/app/profile_page/controller/profile_controller.dart';

import '../../http/authenticated_user.dart';

class ProfilePage extends StatefulWidget {
  final Future<User> user;

  ProfilePage({Key? key, required this.user}) : super(key: key);

  ProfileController profileController = ProfileController();

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var postdata = [
    {
      'postContent':
          'HTML là một ngôn ngữ đánh dấu được thiết kế ra để tạo nên các trang web trên World Wide Web. HTML được tạo ra bởi Tim Berners-Lee vào năm 1990-1991. HTML là viết tắt của cụm từ tiếng Anh HyperText Markup Language, có nghĩa là "Ngôn ngữ đánh dấu siêu văn bản".',
      'postDate': DateTime(2023, 9, 9),
      'postImagePath': 'assets/images/postimage1.png',
      'postName': 'HTML, CSS, JavaScript là gì?',
      'posterAvatarPath': 'assets/images/avt1.jpg',
      'posterName': 'bqtruong2000',
      'tag': 'web'
    },
    {
      'postContent': 'Hi',
      'postDate': DateTime(2023, 10, 30),
      'postImagePath': 'assets/images/postimage2.png',
      'postName': 'Chào mừng đến với Runway club',
      'posterAvatarPath': 'assets/images/avt1.jpg',
      'posterName': 'bqtruong2000',
      'tag': 'welcome'
    },
    {
      'postContent': 'Hi',
      'postDate': DateTime(2023, 10, 31),
      'postImagePath': 'assets/images/postimage2.png',
      'postName': 'Chào mừng đến với Runway club',
      'posterAvatarPath': 'assets/images/avt1.jpg',
      'posterName': 'bqtruong2000',
      'tag': 'welcome'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<User>(
        future: widget.user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            User user = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AvatarProfile(user: user),
                  const SizedBox(height: 10.0),
                  const Divider(height: 1.0, thickness: 1.0),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 5.0, top: 10.0),
                    child: const Text(
                      'Posts',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.document_scanner_outlined),
                    title: Text('2 posts published'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.comment_outlined),
                    title: Text('0 comments written'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.tag_outlined),
                    title: Text('9 tags followed'),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                  const Divider(height: 1.0, thickness: 1.0),
                  const SizedBox(height: 20.0),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 10.0),
                    child: const Text(
                      'Information',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.location_on_outlined),
                    title: Text('Vietnam'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.email_outlined),
                    title: Text('truong.bq@runwayclub.dev'),
                  ),
                  const ListTile(
                    leading: Image(
                        image: AssetImage('assets/images/icon-github.png'),
                        width: 20.0,
                        height: 20.0),
                    title: Text('Runway ATC'),
                  ),
                  const Divider(height: 1.0, thickness: 1.0),
                  const SizedBox(height: 20.0),
                  Center(
                    child: Column(
                      children: postdata.map((postdata) {
                        return Column(
                          children: [
                            const SizedBox(height: 10),
                            PostCard(
                              postImagePath:
                                  postdata['postImagePath'].toString(),
                              postName: postdata['postName'].toString(),
                              tag: postdata['tag'].toString(),
                              posterName: postdata['posterName'].toString(),
                              posterAvatarPath:
                                  postdata['posterAvatarPath'].toString(),
                              postDate: postdata['postDate'] as DateTime,
                              postContent: postdata['postContent'].toString(),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class AvatarProfile extends StatelessWidget {
  final User user;

  const AvatarProfile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: NetworkImage(user.profileImage),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    user.name,
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 10.0, right: 20.0, bottom: 5.0),
                  child: Text(
                    user.githubUserName,
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 10.0,
                      right: 20.0,
                      bottom: 8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Edit Profile'),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.postImagePath,
    required this.postName,
    required this.tag,
    required this.posterName,
    required this.posterAvatarPath,
    required this.postDate,
    required this.postContent,
  });

  final String postImagePath;
  final String postName;
  final String tag;
  final String posterName;
  final String posterAvatarPath;
  final DateTime postDate;
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
              child: Center(
                  child: Image.asset(postImagePath,
                      width: width - 30, height: 182)),
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
                      Text(DateFormat("MMM d''yy").format(postDate),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.5))),
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
                  Text('#$tag',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary)),
                  const SizedBox(height: 10),
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
