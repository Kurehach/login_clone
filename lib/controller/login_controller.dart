import 'dart:convert';
import 'package:login_clone/model/login_model.dart';
import 'package:login_clone/pages/menu_drawer_pages.dart';
import 'package:login_clone/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  var isLoading = false.obs;
  var loginModel = Rxn<LoginModel>();

  void login() async {
    if (txtUsername.text.toString().isEmpty || txtPassword.text.toString().isEmpty) {
      Get.snackbar("Error", "Username dan password harus terisi");
    } else {
      try {
        isLoading.value = true;
        final url = Uri.parse("https://mediadwi.com/api/latihan/login");

        final response = await http.post(url, body: {
          "username": txtUsername.text.toString(),
          "password": txtPassword.text.toString()
        });

        isLoading.value = false;
        if (response.statusCode == 200) {
          loginModel.value = loginModelFromJson(response.body);

          if (loginModel.value?.status == true) {
            Get.snackbar("Berhasil", loginModel.value!.message.toString());
            
            // Pindah ke Main Menu & hapus halaman Login dari stack
            Get.offAll(() => MenuDrawerPages());
          } else {
            Get.snackbar("Gagal", loginModel.value!.message.toString());
          }
        } else {
          Get.snackbar("Gagal", "Cek koneksi internet");
        }
      } catch (e) {
        isLoading.value = false;
        Get.snackbar("Gagal", e.toString());
        print("Error-nya: " + e.toString());
      }
    }
  }
}