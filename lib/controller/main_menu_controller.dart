import 'package:login_clone/menu/history.dart';
import 'package:login_clone/menu/home.dart';
import 'package:login_clone/menu/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController{
  final RxInt SelectedIndex = 0.obs;

  void changePage(int index){
    SelectedIndex.value = index;

  }
  
  List<Widget> listPages = [Home(), History(), Profile()];
}