import 'package:get/get.dart';
import 'package:runway_club_social/app/profile_page/controller/profile_controller.dart';

import '../../../http/articles.dart';
import '../../../http/comment.dart';
import '../../../http/notification.dart';

class BlogController extends GetxController {
  var commentText = ''.obs;
  var comments = <String>[].obs;

  ProfileController profileController = Get.put(ProfileController());
  final article = Article(
    id: 0,
    postImagePath: '',
    postName: '',
    tags: [],
    posterName: '',
    posterAvatarPath: '',
    postDate: '',
    postDescription: '',
    uid: 0,
  ).obs;

  void setComment(String text) {
    commentText.value = text;
  }

  void addComment(
      String articleTitle, String articleOwner, int articleId) async {
    if (commentText.isNotEmpty) {
      Comment newComment = Comment(
          comment: commentText.value,
          articleTitle: articleTitle,
          articleId: articleId,
          articleOwner: articleOwner,
          userName: profileController.user.value.githubUserName,
          uid: profileController.user.value.uid,
          userImage: profileController
              .user.value.profileImage 
          );
      try {
        Comment createdComment = await createComment(newComment);
        comments.add(createdComment.comment);
        commentText.value = '';
        NotificationUser newNotification = NotificationUser(
          articleTitle: articleTitle,
          articleId: articleId,
          articleOwner: articleOwner,
          userName: profileController.user.value.githubUserName,
          uid: profileController.user.value.uid,
          userImage: profileController
              .user.value.profileImage,
          notification: newComment.comment,
          );
        await createNotification(newNotification);
        update(); 
      } catch (e) {
        print('Error creating comment: $e');
      }
    }
  }
}


