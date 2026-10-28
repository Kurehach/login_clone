import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_clone/controller/main_menu_controller.dart';
import 'package:login_clone/controller/menu_drawer_controller.dart';
import 'package:login_clone/pages/menu_drawer_pages.dart';

class MainMenuPages extends StatelessWidget {
  const MainMenuPages({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi Controller
    final MainMenuController menuController = Get.put(MainMenuController());
    final MenuDrawerController drawerController = Get.put(MenuDrawerController());

    // Sinkronkan perubahan index drawer ke main menu controller
    ever(drawerController.selectedIndex, (index) {
      menuController.changePage(index);
    });

    return Scaffold(
      // AppBar utama yang otomatis memunculkan tombol menu drawer di kiri atas
      appBar: AppBar(
        title: Obx(() => Text(
              menuController.titles[menuController.currentIndex.value],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      // Panggil Navigation Drawer di sini sesuai konsep Scaffold Drawer
      drawer: const MenuDrawerPages(),
      // Body berubah reaktif sesuai menu yang dipilih di drawer (Home, History, Profile)
      body: Obx(() => menuController.pages[menuController.currentIndex.value]),
    );
  }
}