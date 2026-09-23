import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var hasilHitung = 0.0.obs;

  void tambah(double angka1, double angka2) {
    double hasil = angka1 + angka2;
    hasilHitung.value = hasil;
    _tampilkanSnackbar("Hasil Jumlah", hasil);
  }

  void kurang(double angka1, double angka2) {
    double hasil = angka1 - angka2;
    hasilHitung.value = hasil;
    _tampilkanSnackbar("Hasil Kurang", hasil);
  }

  void kali(double angka1, double angka2) {
    double hasil = angka1 * angka2;
    hasilHitung.value = hasil;
    _tampilkanSnackbar("Hasil Kali", hasil);
  }

  void bagi(double angka1, double angka2) {
    if (angka2 == 0) {
      Get.snackbar(
        "Error",
        "Pembagi tidak boleh nol",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF1E1E24),
        colorText: const Color(0xFFD4AF37),
      );
      return;
    }
    double hasil = angka1 / angka2;
    hasilHitung.value = hasil;
    _tampilkanSnackbar("Hasil Bagi", hasil);
  }

  void _tampilkanSnackbar(String title, double hasil) {
    Get.snackbar(
      title,
      hasil.toString(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF1E1E24),
      colorText: const Color(0xFFD4AF37),
      borderColor: const Color(0xFFD4AF37).withOpacity(0.3),
      borderWidth: 1,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    );
  }
}