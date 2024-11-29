import 'package:flutter/material.dart';
import 'package:runway_club_social/http/articles.dart';

import '../../app/news_page/news_page.dart';
class MySearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: postdataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No data found');
        } else {
          final searchData = query.toLowerCase();
          final searchResults = snapshot.data!.where((post) {
            final postName = post.postName.toLowerCase();
            return postName.contains(searchData);
          }).toList();

          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: searchResults.map((post) {
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      PostCard(
                        id: post.id,
                        postImagePath: post.postImagePath,
                        postName: post.postName,
                        tags: post.tags,
                        posterName: post.posterName,
                        posterAvatarPath: post.posterAvatarPath,
                        postDate: post.postDate,
                        postDescription: post.postDescription,
                        uid: post.uid,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: postdataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No suggestions found'));
        } else {
          final suggestions = snapshot.data!.where((post) {
            final postName = post.postName.toLowerCase();
            final searchData = query.toLowerCase();
            return postName.contains(searchData);
          }).toList();

          return ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              final post = suggestions[index];
              return ListTile(
                title: Text(post.postName),
                onTap: () {
                  query = post
                      .postName; 
                },
              );
            },
          );
        }
      },
    );
  }
}
