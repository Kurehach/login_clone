import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_clone/controller/main_menu_controller.dart';

class MainMenuPages extends StatelessWidget {
  MainMenuPages({super.key});

  final menuController = Get.put(MainMenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
      body: IndexedStack(
        index: menuController.selectedIndex.value, 
        children: menuController.listPages
        ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: menuController.changePage, 
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: "Home"
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history), 
            label: "History"
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), 
            label: "Profile"
            ),
        ]),
    ));
  }
}