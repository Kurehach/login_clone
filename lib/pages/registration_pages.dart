import 'package:login_clone/component/text_field.dart';
import 'package:login_clone/controller/registration_controller.dart';
import 'package:login_clone/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RegistrationPages extends StatelessWidget {
  const RegistrationPages({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
        backgroundColor: const Color.fromARGB(255, 91, 91, 91),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Textfield(
              myHint: "Input Nama",
              txtController: controller.txtNama,
            ),

            Textfield(
              myHint: "Input Alamat",
              txtController: controller.txtAlamat,
            ),

            TextField(
              controller: controller.txtNoWa,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: "Input No. WhatsApp",
              ),
            ),

            Textfield(
              myHint: "Input Email",
              txtController: controller.txtEmail,
            ),

            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Obx(
                () => DropdownButton<String>(
                  value: controller.jenisKelamin.value.isEmpty
                      ? null
                      : controller.jenisKelamin.value,
                  isExpanded: true,
                  hint: const Text("Pilih Jenis Kelamin"),
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(
                      value: "Laki-laki",
                      child: Text("Laki-laki"),
                    ),
                    DropdownMenuItem(
                      value: "Perempuan",
                      child: Text("Perempuan"),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      controller.jenisKelamin.value = value;
                    }
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 74, 74, 74),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Get.toNamed(
                  Routes.confirmRegistration,
                  arguments: {
                    'name': controller.txtNama.text,
                    'jenis_kelamin': controller.jenisKelamin.value,
                    'alamat': controller.txtAlamat.text,
                    'no_wa': controller.txtNoWa.text,
                    'email': controller.txtEmail.text,
                  },
                );
              },
              child: const Text("Send"),
            ),
          ],
        ),
      ),
    );
  }
}