import 'package:login_clone/controller/confirm_registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmRegistrationPages extends StatelessWidget {
  const ConfirmRegistrationPages({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConfirmRegistrationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirm Registration"),
        backgroundColor: const Color.fromARGB(255, 81, 81, 81),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Data Registrasi",
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              _dataCard(
                title: "Nama",
                value: controller.nama,
              ),

              _dataCard(
                title: "Jenis Kelamin",
                value: controller.jenisKelamin,
              ),

              _dataCard(
                title: "Alamat",
                value: controller.alamat,
              ),

              _dataCard(
                title: "No. WhatsApp",
                value: controller.noWa,
              ),

              _dataCard(
                title: "Email",
                value: controller.email,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _dataCard({
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            value,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}