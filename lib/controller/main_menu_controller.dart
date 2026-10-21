import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_clone/menu/history.dart';
import 'package:login_clone/menu/home.dart';
import 'package:login_clone/menu/profile.dart';

class MainMenuController extends GetxController{
  final RxInt selectedIndex = 0.obs;

  void changePage(int index){
    selectedIndex.value = index;
  }

  List<Widget> listPages = [Home(), History(), Profile()];
}