import 'package:get/get.dart';

import '../../../http/authenticated_user.dart';

class ProfileController extends GetxController {
  final String name = 'Trường Bùi Quang';
  final String username = '@bqtruong2000';
  final String country = 'Vietnam';
  final String email = 'truong.bq@runwayclub.dev';
  final String organization = 'Runway ATC';

  final user = User(
    uid: 0,
    userName: '',
    name: '',
    githubUserName: '',
    summary: '',
    location: '',
    websiteUrl: '',
    joinedAt: '',
    profileImage: '',
  ).obs;

  @override
  void onInit() {
    fetchUser(69).then((value) => user.value = value);
    super.onInit();
  }
}
