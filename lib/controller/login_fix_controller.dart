import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginFixController extends GetxController {
  // Deklarasi text editing controller sesuai video
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  // Variabel bolean untuk loading dengan .obs
  var isLoading = false.obs;


  void login() async {
    // Validasi form kosong
    if (txtUsername.text.toString().isEmpty || txtPassword.text.toString().isEmpty) {
      Get.snackbar(
        "Error",
        "username dan password harus terisi",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }else{

    try {
      // Set loading jadi true
      isLoading.value = true;
      final url = Uri.parse("https://mediadwi.com/api/latihan/login");  

      // Hit API menggunakan method POST dan URI.parse
      final response = await http.post( url, body: {
          'username': txtUsername.text,
          'password': txtPassword.text,
        });

      // Kembalikan loading jadi false
      isLoading.value = false;

      // Cek status code 200 (sukses)
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          Get.snackbar(
            "Sukses", 
            data['message'], 
            backgroundColor: Colors.green, 
            colorText: Colors.white
            
          );
          Get.toNamed('/drawer');
        } else {
          Get.snackbar(
            "Gagal", 
            data['message'], 
            backgroundColor: Colors.red, 
            colorText: Colors.white
          );
        }
      } else {
        Get.snackbar(
          "Error", 
          "Terjadi kesalahan pada server", 
          backgroundColor: Colors.red, 
          colorText: Colors.white
        );
      }
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      Get.snackbar(
        "Gagal", 
        e.toString(), 
        backgroundColor: Colors.red, 
        colorText: Colors.white
      );
    }
  }
}
}