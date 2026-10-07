import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final txtNama = TextEditingController();
  final txtAlamat = TextEditingController();
  final txtNoWa = TextEditingController();
  final txtEmail = TextEditingController();

  final jenisKelamin = ''.obs;

  @override
  void onClose() {
    txtNama.dispose();
    txtAlamat.dispose();
    txtNoWa.dispose();
    txtEmail.dispose();

    super.onClose();
  }
}