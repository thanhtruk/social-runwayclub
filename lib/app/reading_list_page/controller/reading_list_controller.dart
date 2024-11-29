import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadingListController extends GetxController {
  var checkState =
      <int, bool>{}.obs; 
  var icon = <int, IconData>{}.obs; 

  void updateCheckState(int id, bool newState) {
    checkState[id] = newState;
  }

  void updateIcon(int id, IconData newIcon) {
    icon[id] = newIcon;
  }

  @override
  void onInit() {
    super.onInit();
    for (int i = 0; i < 200; i++) {
      checkState[i] = false;
    }

    for (int i = 0; i < 200; i++) {
      icon[i] = Icons.bookmark_outline;
    }
  }
}
