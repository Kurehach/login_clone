import 'package:get/get.dart';

class MenuDrawerController extends GetxController {
  // Index aktif: 0 = Home, 1 = History, 2 = Profile
  var selectedIndex = 0.obs;

  void changePageIndex(int index) {
    selectedIndex.value = index;
  }
}