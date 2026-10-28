
import 'package:login_clone/controller/menu_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuDrawerPages extends StatelessWidget {
  MenuDrawerPages({super.key});

  final menuDrawerController = Get.put(MenuDrawerController());

  final Color appColor = const Color.fromRGBO(23, 32, 48, 1);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("My Application"),
          backgroundColor: appColor,
          foregroundColor: Colors.white,
        ),

        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: appColor,
                ),
                accountName: const Text("My Application"),
                accountEmail: const Text("Navigation Menu"),
                currentAccountPicture: const CircleAvatar(
                  child: Icon(Icons.person, size: 35),
                ),
              ),

              ListTile(
                leading: const Icon(Icons.home_filled),
                title: const Text("Home"),
                selected: menuDrawerController.selectedIndex.value == 0,
                onTap: () {
                  menuDrawerController.changePage(0);
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(Icons.history),
                title: const Text("History"),
                selected: menuDrawerController.selectedIndex.value == 1,
                onTap: () {
                  menuDrawerController.changePage(1);
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
                selected: menuDrawerController.selectedIndex.value == 2,
                onTap: () {
                  menuDrawerController.changePage(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),

        body: menuDrawerController
            .listPages[menuDrawerController.selectedIndex.value],
      ),
    );
  }
}