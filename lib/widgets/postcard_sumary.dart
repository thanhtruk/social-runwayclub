import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/reading_list_page/controller/reading_list_controller.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.id,
    required this.postImagePath,
    required this.postName,
    required this.tags,
    required this.posterName,
    required this.posterAvatarPath,
    required this.postDate,
    required this.postDescription,
  });

  final int id; 
  final String postImagePath;
  final String postName;
  final List<String> tags;
  final String posterName;
  final String posterAvatarPath;
  final String postDate;
  final String postDescription;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var widthCard = screenWidth * 0.94;
    final theme = Theme.of(context);
    ReadingListController c = Get.put(ReadingListController());

    return SizedBox(
      width: widthCard,
      child: Card(
        surfaceTintColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(posterAvatarPath),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: screenWidth * 0.63,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(posterName,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        Text(postDate,
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
                  ),
                  Obx(
                    () => IconButton(
                      onPressed: () {
                        c.updateCheckState(id, !c.checkState[id]!);
                        if (c.checkState[id]!) {
                          c.updateIcon(id, Icons.bookmark);
                        } else {
                          c.updateIcon(id, Icons.bookmark_outline);
                        }
                      },
                      icon: Icon(c.icon[id]), 
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(postName,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  Text(tags.map((tag) => '#$tag').join(', '),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary)),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
