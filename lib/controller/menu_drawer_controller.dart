
import 'package:login_clone/menu/home.dart';
import 'package:login_clone/menu/history.dart';
import 'package:login_clone/menu/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuDrawerController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  List<Widget> listPages = [
    Home(),
    History(),
    Profile(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}