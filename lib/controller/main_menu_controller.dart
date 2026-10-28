import 'package:get/get.dart';
import 'package:login_clone/menu/Home.dart';
import 'package:login_clone/menu/History.dart';
import 'package:login_clone/menu/Profile.dart';
import 'package:flutter/material.dart';

class MainMenuController extends GetxController {
  var currentIndex = 0.obs;

  // Daftar halaman menu utama
  final List<Widget> pages = [
    const Home(),
    const History(),
    const Profile(),
  ];

  final List<String> titles = [
    "Katalog Produk",
    "Riwayat Transaksi",
    "Profil Akun",
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }
}