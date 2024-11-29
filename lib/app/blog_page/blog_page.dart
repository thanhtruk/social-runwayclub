import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runway_club_social/http/user.dart';

import '../../app/blog_page/controllers/blog_controller.dart';
import '../../http/articles.dart';
import '../../http/user_article.dart';
import '../profile_page/controller/profile_controller.dart';

class BlogPage extends StatelessWidget {
  final Article article;

  BlogPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder<Blog>(
      future: fetchBlog(article.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); 
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); 
        } else {
          Blog blog = snapshot.data!;
          CreateUser(blog);
          // Retrieved blog data
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              actions: <Widget>[
                Container(
                  width: 200.0,
                  margin: const EdgeInsets.only(right: 90.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(article.posterAvatarPath),
                        radius: 20,
                      ),
                      SizedBox(width: 10),
                      Text(blog.blogUserName,
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                IconButton(
                  padding: const EdgeInsets.only(right: 10.0),
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                  color: Colors.black,
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    MyImageWidget(blog: blog),
                  ],
                ),
              ),
            ),
          );
        }
      });
}

class MyImageWidget extends StatelessWidget {
  final Blog blog;
  final BlogController c = Get.put(BlogController());
  ProfileController _profileController = Get.put(ProfileController());

  MyImageWidget({required this.blog});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                child: Image.network(blog.blogImage),
              ),
              SizedBox(height: 16.0),
              const Divider(height: 1.0, thickness: 0.5),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Publish at ' + blog.blogPublishedAt,
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      blog.blogTitle,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.center,
                child: Text(
                  blog.blogContent, style: TextStyle(fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GetBuilder<BlogController>(
                  builder: (_) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: c.comments
                        .map((comment) => CommentCard(
                            comment: comment,
                            userAvatarUrl: blog.blogUserAvatar,
                            userName:
                                _profileController.user.value.githubUserName))
                        .toList(),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: c.setComment,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your comment',
                    suffixIcon: IconButton(
                      onPressed: () {
                        c.addComment(
                            blog.blogTitle, blog.blogUserName, blog.id);
                        FocusScope.of(context)
                            .unfocus(); 
                      },
                      icon: Icon(Icons.send),
                      color: Color(0xFF426ef0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CommentCard extends StatelessWidget {
  ProfileController _profileController = Get.put(ProfileController());

  final String userName;
  final String comment;
  final String userAvatarUrl; 
  
  CommentCard({
    required this.userName,
    required this.comment,
    required this.userAvatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage:
                NetworkImage(_profileController.user.value.profileImage),
            radius: 20,
          ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    comment,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
