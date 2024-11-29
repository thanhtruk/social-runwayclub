import 'package:get/get.dart';

import '../../../http/all_comments.dart';
import '../../../http/comment.dart';
import '../../blog_page/controllers/blog_controller.dart';

class NewsController extends GetxController {
  Future<void> onViewBlogClicked(int blogId) async {
    BlogController blogController = Get.find();
    List<Comment> comments = await GetCommentsById(blogId);
    print(comments);
    if (comments.isEmpty) {
      blogController.comments.value = [];
    } else {
      blogController.comments.value =
          comments.map((comment) => comment.comment).toList();
    }
  }
}
